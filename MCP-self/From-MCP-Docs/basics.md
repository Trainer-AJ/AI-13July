# What is the Model Context Protocol (MCP)?

MCP (Model Context Protocol) is an open-source standard for connecting AI applications to external systems.

Using MCP, AI applications like Claude or ChatGPT can connect to data sources (e.g. local files, databases), tools (e.g. search engines, calculators) and workflows (e.g. specialized prompts)—enabling them to access key information and perform tasks.

Think of MCP like a USB-C port for AI applications. Just as USB-C provides a standardized way to connect electronic devices, MCP provides a standardized way to connect AI applications to external systems.

<Frame>
  <img src="https://mintcdn.com/mcp/bEUxYpZqie0DsluH/images/mcp-simple-diagram.png?fit=max&auto=format&n=bEUxYpZqie0DsluH&q=85&s=35268aa0ad50b8c385913810e7604550" data-og-width="3840" width="3840" data-og-height="1500" height="1500" data-path="images/mcp-simple-diagram.png" data-optimize="true" data-opv="3" srcset="https://mintcdn.com/mcp/bEUxYpZqie0DsluH/images/mcp-simple-diagram.png?w=280&fit=max&auto=format&n=bEUxYpZqie0DsluH&q=85&s=0cea440365b03c2f2a299b0104375b8b 280w, https://mintcdn.com/mcp/bEUxYpZqie0DsluH/images/mcp-simple-diagram.png?w=560&fit=max&auto=format&n=bEUxYpZqie0DsluH&q=85&s=2391513484df96fa7203739dae5e53b0 560w, https://mintcdn.com/mcp/bEUxYpZqie0DsluH/images/mcp-simple-diagram.png?w=840&fit=max&auto=format&n=bEUxYpZqie0DsluH&q=85&s=96f5e553bee1051dc882db6c832b15bc 840w, https://mintcdn.com/mcp/bEUxYpZqie0DsluH/images/mcp-simple-diagram.png?w=1100&fit=max&auto=format&n=bEUxYpZqie0DsluH&q=85&s=341b88d6308188ab06bf05748c80a494 1100w, https://mintcdn.com/mcp/bEUxYpZqie0DsluH/images/mcp-simple-diagram.png?w=1650&fit=max&auto=format&n=bEUxYpZqie0DsluH&q=85&s=a131a609c7b6a70f342f493bbad57fcb 1650w, https://mintcdn.com/mcp/bEUxYpZqie0DsluH/images/mcp-simple-diagram.png?w=2500&fit=max&auto=format&n=bEUxYpZqie0DsluH&q=85&s=dc4ab238184b6c70e06e871681c921c5 2500w" />
</Frame>

## What can MCP enable?

* Agents can access your Google Calendar and Notion, acting as a more personalized AI assistant.
* Claude Code can generate an entire web app using a Figma design.
* Enterprise chatbots can connect to multiple databases across an organization, empowering users to analyze data using chat.
* AI models can create 3D designs on Blender and print them out using a 3D printer.

## High level Components:
> MCP is stateful protocol // The purpose of lifecycle management is to negotiate the capabilities that both client and server support.
- MCP Host: The AI application that coordinates and manages one or multiple MCP clients
- MCP Client: A component that maintains a connection to an MCP server and obtains context from an MCP server for the MCP host to use
- MCP Server: A program that provides context to MCP clients
> 1 MCP Client <==> 1 MCP Server
```mermaid  theme={null}
graph TB
    subgraph "MCP Host (AI Application)"
        Client1["MCP Client 1"]
        Client2["MCP Client 2"]
        Client3["MCP Client 3"]
        Client4["MCP Client 4"]
    end

    ServerA["MCP Server A - Local<br/>(e.g. Filesystem)"]
    ServerB["MCP Server B - Local<br/>(e.g. Database)"]
    ServerC["MCP Server C - Remote<br/>(e.g. Sentry)"]

    Client1 ---|"Dedicated<br/>connection"| ServerA
    Client2 ---|"Dedicated<br/>connection"| ServerB
    Client3 ---|"Dedicated<br/>connection"| ServerC
    Client4 ---|"Dedicated<br/>connection"| ServerC
```
- Conceptually the `data layer` is the inner layer, while the `transport layer` is the outer layer. [MCP Docs on layers](https://modelcontextprotocol.io/docs/learn/architecture#layers)
