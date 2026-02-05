# Dev Container for MCP Security Summit Workshop

This dev container provides a fully configured development environment for the MCP Security Summit Workshop.

## Included Tools

| Tool | Version | Purpose |
|------|---------|---------|
| **Python** | 3.11 | MCP servers and scripts |
| **Node.js** | 22 | Frontend tooling |
| **Azure CLI** | Latest | Azure resource management |
| **Azure Developer CLI (azd)** | Latest | Application provisioning and deployment |
| **Azure Functions Core Tools** | 4.x | Local Azure Functions development |
| **Docker** | Latest | Container building and deployment |
| **uv** | Latest | Fast Python package management |
| **Git** | Latest | Version control |

## VS Code Extensions

The following extensions are automatically installed:

- **Python** - Python language support
- **Azure Tools** - Azure resource management pack
- **Bicep** - Infrastructure as Code editing
- **Azure Developer CLI** - azd integration
- **Azure Functions** - Functions development
- **Docker** - Container management

> **Note:** GitHub Copilot is recommended for the exploitation demos but not required. Install it manually if needed.

## Getting Started

### Using VS Code

1. Install the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
2. Open this repository in VS Code
3. Press `F1` and select **Dev Containers: Reopen in Container**
4. Wait for the container to build (~5-10 minutes first time)

### Using GitHub Codespaces

Click the **Code** button on GitHub and select **Create codespace on main**.

## Post-Setup

After the container starts, authenticate with Azure:

```bash
# Login to Azure CLI
az login

# Login to Azure Developer CLI
azd auth login

# Verify authentication
az account show
azd auth login --check-status
```

## Forwarded Ports

| Port | Service |
|------|---------|
| 8000 | MCP Server (development) |
| 7071 | Azure Functions (local) |

## Requirements

- **Memory**: 8GB minimum recommended
- **Docker**: Must be running on your host machine

## Troubleshooting

### Container build fails

Ensure Docker is running and you have at least 8GB of memory available.

### Azure authentication issues

```bash
# Clear and re-authenticate
az logout
az login

azd auth logout
azd auth login
```

### Python packages not found

Use `uv` for package management:

```bash
cd camps/base-camp
uv sync
```
