# 🚀 Deploy two NGINX VMs behind a Standard Public Load Balancer (idempotent steps)

**Purpose:** Create two Linux VMs (no public IPs), install nginx + a dynamic `index.html` that shows the VM hostname, place both VMs behind a Standard Public Load Balancer (LB) with a public IP. Use this file + the included PowerShell script to repeat the task reliably.

---

## ✅ Prerequisites
- Azure CLI installed and logged in: `az login`
- Subscription set: `az account set -s <subscription-id>`
- Run from PowerShell (Windows) or Bash (adapt commands slightly for Bash)
- Have a secure admin password to use for the VMs (or adjust the script to use SSH keys)

---

## ⚙️ Files created
- `deploy-two-vms-behind-lb.ps1` — runnable PowerShell script that performs the full setup
- This `deploy-two-vms-behind-lb.md` — human-readable instructions + quick reference

---

## Usage (quick)
1. Open PowerShell in the `infra` folder.
2. Login and set subscription: `az login` and `az account set -s <subscription-id>`
3. Run: `pwsh .\deploy-two-vms-behind-lb.ps1` and follow the prompts.

> Tip: For full automation, set the variables inside the script instead of interactive prompts.

---

## What the script does (high level)
1. Creates resource group (if missing), VNet/subnet, and NSG (SSH + HTTP allowed).
2. Creates two NICs (no public IPs) and two Ubuntu VMs using password authentication.
3. Installs nginx on each VM and deploys a dynamic `index.html` containing `Served from <hostname>`.
4. Creates a Standard public IP + Standard Load Balancer in the same region with a health probe and a rule for HTTP/80.
5. Adds both VM NIC ip configs to the LB backend pool and verifies the LB public IP.
6. Provides a curl command to test the LB and verify responses include the backend VM hostname.

---

## Important notes
- **Standard LB + Standard Public IP**: Script uses Standard SKU. Ensure existing public IPs of VMs (if any) are removed or in same SKU before adding NICs to the LB.
- **Security**: The script uses password auth by default (prompt). For production use, switch to SSH keys.
- **Regions**: Choose a single region (location) consistently for all resources.

---

## Rollback / destroy
When done, tear down with:
```powershell
az group delete -n $RG --yes --no-wait
```

---

## Support / next steps
- Want HTTPS? I can add Certbot / Let's Encrypt automation and redirect HTTP→HTTPS.
- Want to use Azure ARM/Bicep for infra-as-code? I can convert this script into a Bicep template.

---

## Full script (also saved as `deploy-two-vms-behind-lb.ps1`)
The script below is included as a separate file so it can be run directly.

```powershell
# See separate file: deploy-two-vms-behind-lb.ps1
```

---

Happy to update this file to match any naming or security preferences you have (SSH keys, custom image, different size, tags).
