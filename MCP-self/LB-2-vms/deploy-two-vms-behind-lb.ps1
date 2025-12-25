<#
Deploy two Ubuntu VMs (no public IP) and place them behind a Standard Public Load Balancer.
Run in PowerShell. Requires az CLI and you to be logged in.
#>

# --- Config (edit as needed) ---
$RG = Read-Host -Prompt "Resource group name (e.g. rg-nginx-centralindia)"
$Location = Read-Host -Prompt "Location (e.g. eastus or centralindia)"
$VNetName = "vm-nginx-centralindia-vnet"
$SubnetName = "default"
$NSG = "vm-nginx-centralindia-nsg"
$VM1 = "vm-nginx-centralindia"
$VM2 = "vm-nginx-centralindia-2"
$AdminUser = "azureuser"
# Provide a strong password or set $AdminPassword by editing the script directly
$AdminPassword = Read-Host -Prompt "Admin password for VMs (will be used for both VMs)"
$VmSize = "Standard_B1s"
$Image = "Ubuntu2204"
$LBName = "lb-nginx"
$LBPublicIPName = "lb-nginx-pip"
$LBFrontend = "lbFront"
$LBBackend = "lbBackend"
$ProbeName = "httpProbe"
$RuleName = "httpRule"

Write-Host "Using RG=$RG Location=$Location VMs: $VM1, $VM2"

# --- Ensure resource group exists ---
az group create -n $RG -l $Location | Out-Null

# --- Create VNet/subnet (idempotent) ---
az network vnet create -g $RG -n $VNetName --address-prefix 10.0.0.0/16 --subnet-name $SubnetName --subnet-prefix 10.0.0.0/24 -o none

# --- Create NSG and allow SSH & HTTP ---
az network nsg create -g $RG -n $NSG -o none
az network nsg rule create -g $RG --nsg-name $NSG -n AllowSSH --priority 1000 --protocol Tcp --destination-port-range 22 --access Allow --direction Inbound -o none
az network nsg rule create -g $RG --nsg-name $NSG -n AllowHTTP --priority 1010 --protocol Tcp --destination-port-range 80 --access Allow --direction Inbound -o none

# --- Create NICs (no public IP) ---
function Ensure-Nic($nicName) {
    $exists = az network nic show -g $RG -n $nicName --query "name" -o tsv 2>$null
    if (-not $exists) {
        az network nic create -g $RG -n $nicName --vnet-name $VNetName --subnet $SubnetName --network-security-group $NSG -o none
        Write-Host "Created NIC $nicName"
    } else { Write-Host "NIC $nicName exists, skipping" }
}
Ensure-Nic "$VM1-nic"
Ensure-Nic "$VM2-nic"

# --- Create (or skip if exists) VMs attached to NICs ---
function Ensure-VM($vmName, $nicName) {
    $exists = az vm show -g $RG -n $vmName --query "name" -o tsv 2>$null
    if (-not $exists) {
        az vm create -g $RG -n $vmName --nics $nicName --image $Image --admin-username $AdminUser --authentication-type password --admin-password $AdminPassword --size $VmSize --no-wait -o none
        Write-Host "Started create for $vmName (may take a minute)"
        az vm wait -g $RG -n $vmName --created
    } else { Write-Host "VM $vmName exists, skipping creation" }
}
Ensure-VM $VM1 "$VM1-nic"
Ensure-VM $VM2 "$VM2-nic"

# --- Make sure nginx + index.html (shows hostname) are on both VMs ---
function Deploy-Index($vmName) {
    $script = @"
sudo apt-get update -y
sudo apt-get install -y nginx
sudo tee /var/www/html/index.html > /dev/null <<'HTML'
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Animated Date & Time</title>
<style>
 body { margin: 0; height: 100vh; display: flex; justify-content: center; align-items: center; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; color: white; font-size: 3rem; text-align: center; background: linear-gradient(270deg, #ff5f6d, #ffc371, #24c6dc, #514a9d); background-size: 800% 800%; animation: gradientAnimation 15s ease infinite; }
 @keyframes gradientAnimation {0% {background-position: 0% 50%;} 50% {background-position: 100% 50%;} 100% {background-position: 0% 50%;}}
 .datetime { background: rgba(0,0,0,0.3); padding: 20px 40px; border-radius: 20px; box-shadow: 0 0 20px rgba(0,0,0,0.5);} .vmid { font-size: 0.6em; opacity: 0.9; margin-top: 12px; }
</style>
</head>
<body>
  <div class="datetime" id="datetime"></div>
  <div class="vmid" id="vmid">Served from <strong>$(hostname)</strong></div>
<script>
function updateDateTime() { const now = new Date(); const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' }; const dateStr = now.toLocaleDateString(undefined, options); const timeStr = now.toLocaleTimeString(); document.getElementById('datetime').innerHTML = `${dateStr}<br>${timeStr}`; }
setInterval(updateDateTime, 1000); updateDateTime();
</script>
</body>
</html>
HTML
sudo chown root:root /var/www/html/index.html && sudo chmod 644 /var/www/html/index.html
sudo systemctl enable --now nginx
"@
    az vm run-command invoke -g $RG -n $vmName --command-id RunShellScript --scripts $script -o none
    Write-Host "Deployed index.html on $vmName"
}
Deploy-Index $VM1
Deploy-Index $VM2

# --- Remove public IPs from VMs if present (Standard LB doesn't allow mixing Basic/Standard) ---
function Remove-PubIP-From-VM($vmName) {
    $nicId = az vm show -g $RG -n $vmName --query "networkProfile.networkInterfaces[0].id" -o tsv
    if ($nicId) {
        $nicName = ($nicId -split "/")[-1]
        $pubid = az network nic show -g $RG -n $nicName --query "ipConfigurations[0].publicIPAddress.id" -o tsv 2>$null
        if ($pubid) {
            $pipName = ($pubid -split "/")[-1]
            Write-Host "Removing public IP $pipName from $nicName and deleting the resource"
            az network nic ip-config update -g $RG --nic-name $nicName --name ipconfig1 --remove publicIPAddress -o none
            az network public-ip delete -g $RG -n $pipName -o none
        } else { Write-Host "No public IP on $vmName" }
    }
}
Remove-PubIP-From-VM $VM1
Remove-PubIP-From-VM $VM2

# --- Create Standard public IP + Load Balancer in same $Location ---
az network public-ip create -g $RG -n $LBPublicIPName --sku Standard --allocation-method Static --location $Location -o none
az network lb create -g $RG -n $LBName --sku Standard --public-ip-address $LBPublicIPName --frontend-ip-name $LBFrontend --backend-pool-name $LBBackend --location $Location -o none
az network lb probe create -g $RG --lb-name $LBName -n $ProbeName --protocol Http --path / --port 80 -o none
az network lb rule create -g $RG --lb-name $LBName -n $RuleName --protocol tcp --frontend-port 80 --backend-port 80 --frontend-ip-name $LBFrontend --backend-pool-name $LBBackend --probe-name $ProbeName -o none

# --- Add both NICs to LB backend pool ---
az network nic ip-config address-pool add -g $RG --nic-name "$VM1-nic" --ip-config-name ipconfig1 --lb-name $LBName --address-pool $LBBackend -o none
az network nic ip-config address-pool add -g $RG --nic-name "$VM2-nic" --ip-config-name ipconfig1 --lb-name $LBName --address-pool $LBBackend -o none

# --- Output LB public IP ---
$lbip = az network public-ip show -g $RG -n $LBPublicIPName --query "ipAddress" -o tsv
Write-Host "Load Balancer public IP: $lbip"

# --- Verify via LB public IP (optional simple test) ---
Write-Host "Testing HTTP on Load Balancer (single request):"
try { curl -m 10 http://$lbip -s | Select-String "Served from" -SimpleMatch } catch { Write-Host "curl not available or request failed" }

Write-Host "Done. Browse: http://$lbip  (you should see 'Served from <vm-hostname>')"

# EOF
