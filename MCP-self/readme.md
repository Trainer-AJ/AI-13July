[vs code docs to add mcp server](https://code.visualstudio.com/docs/copilot/customization/mcp-servers#_add-an-mcp-server)

```json
{
  "servers": {
    "Azure MCP Server": {
      "command": "npx",
      "args": [
        "-y",
        "@azure/mcp@latest",
        "server",
        "start"
      ],
      "type": "stdio"
    },
    "aws-mcp": {
      "command": "uvx",
      "args": [
        "mcp-proxy-for-aws@latest",
        "https://aws-mcp.us-east-1.api.aws/mcp",
        "--metadata",
        "AWS_REGION=ap-south-1"
      ],
      "type": "stdio"
    }
  },
  "inputs": []
}

```

```sh
az vm image list-skus -l centralindia -f ubuntu -p Canonical
```
