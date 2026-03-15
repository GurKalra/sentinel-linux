#!/bin/bash
set -e

REPO_URL="https://github.com/GurKalra/sentinel-linux.git"
INSTALL_DIR="$HOME/.sentinel"

echo "Deploying Sentinel....."

# Upfront sudo check
echo "Checking sudo privileges for global installation..."
if ! sudo -v &> /dev/null; then
    echo "Error: sudo privileges are required for system-wide installation."
    exit 1
fi

# Check prerequisites
if ! command -v git &> /dev/null || ! command -v python3 &> /dev/null || ! command -v make &> /dev/null; then
    echo "Error: git, python3, and make are required but not installed."
    exit 1
fi

# Check for python 3.11+
PY_VERSION=$(python3 -c "import sys; print(sys.version_info >= (3, 11))")
if [ "$PY_VERSION" != "True" ]; then
    echo "Error: Python 3.11 or higher is required."
    exit 1
fi

# Clone or update the repository
if [ -d "$INSTALL_DIR" ]; then
    echo "Updating existing installation..."
    cd "$INSTALL_DIR"
    git pull origin main --quiet
else
    echo "Cloning Sentinel repository..."
    git clone --quiet "$REPO_URL" "$INSTALL_DIR"
    cd "$INSTALL_DIR"
fi

# Create the isolated virtual enviroment
echo "Setting up isolated Python environment..."
python3 -m venv .venv

# Install the package in editable mode (-e) so it auto-updates with git pulls
echo "Installing dependencies (Developer Mode)..."
.venv/bin/pip install -q -e .

# Calling the Makefile to create the global symlink
echo "Handing off to Makefile for system integration..."
make install

echo ""
echo "Sentinel deployed successfully!"
echo "Core commands available: "
echo "  sudo sentinel install-hooks  # Wire into apt/pacman"
echo "  sudo sentinel predict        # Manual risk scan"
echo "  sudo sentinel diagnose       # Post-crash analysis"
echo "  sudo sentinel heal           # Transparent auto-recovery"
echo "  sudo sentinel undo           # Roll back last update"