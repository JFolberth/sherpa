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
