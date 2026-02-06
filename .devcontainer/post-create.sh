#!/bin/bash
set -e

echo "🏔️ Setting up MCP Security Summit Workshop environment..."

# Install uv for fast Python package management
echo "📦 Installing uv..."
curl -LsSf https://astral.sh/uv/install.sh | sh
export PATH="$HOME/.local/bin:$PATH"

# Source the new PATH for current session
if [ -f "$HOME/.bashrc" ]; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
fi

# Install MCP Inspector globally
echo "🔍 Installing MCP Inspector..."
npm install -g @modelcontextprotocol/inspector

# Configure MCP Inspector for Codespaces port forwarding
# In Codespaces, each forwarded port gets a unique hostname (e.g., {name}-{port}.app.github.dev)
# The Inspector proxy needs special config because the UI and proxy are on different hostnames
if [ -n "$CODESPACE_NAME" ]; then
    echo "☁️  Codespaces detected - configuring MCP Inspector for port forwarding..."
    PROXY_URL="https://${CODESPACE_NAME}-6277.${GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN}"
    CLIENT_ORIGIN="https://${CODESPACE_NAME}-6274.${GITHUB_CODESPACES_PORT_FORWARDING_DOMAIN}"
    INSPECTOR_URL="${CLIENT_ORIGIN}/?MCP_PROXY_FULL_ADDRESS=${PROXY_URL}"
    {
        echo ""
        echo "# MCP Inspector Codespaces configuration"
        echo "export MCP_PROXY_FULL_ADDRESS=\"${PROXY_URL}\""
        echo "export ALLOWED_ORIGINS=\"http://localhost:6274,${CLIENT_ORIGIN}\""
        echo "export DANGEROUSLY_OMIT_AUTH=true"
        echo "export MCP_AUTO_OPEN_ENABLED=false"
    } >> "$HOME/.bashrc"
    echo "   Inspector URL: ${INSPECTOR_URL}"
    echo ""
    echo "   💡 To launch the inspector, run:"
    echo "      npx @modelcontextprotocol/inspector"
    echo "   Then open the URL above in your browser."
fi

# Verify installations
echo ""
echo "✅ Verifying installations..."
echo "----------------------------"
echo "Azure CLI: $(az --version | head -n1)"
echo "Azure Developer CLI: $(azd version)"
echo "Python: $(python --version)"
echo "Node.js: $(node --version)"
echo "Azure Functions Core Tools: $(func --version)"
echo "uv: $($HOME/.local/bin/uv --version)"
echo "Docker: $(docker --version)"
echo "Git: $(git --version)"
echo ""

echo "🎉 Setup complete! You're ready to start the MCP Security Summit Workshop."
echo ""
echo "📚 Next steps:"
echo "   1. Run 'az login' to authenticate with Azure"
echo "   2. Run 'azd auth login' to authenticate with Azure Developer CLI"
echo "   3. Navigate to 'camps/base-camp' to start the workshop"
echo ""
