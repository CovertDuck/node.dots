#!/usr/bin/env sh

# Detect the operating system
OS=$(uname -s)

echo "Detected OS: $OS"

# Install YADM based on the operating system
case "$OS" in
    Linux*)
        echo "Installing YADM on Linux..."
        sudo apt update
        sudo apt install -y yadm
        ;;
    Darwin*)
        echo "Installing YADM on macOS..."
        brew install yadm
        ;;
    *)
        echo "Unsupported operating system: $OS"
        echo "This script supports Linux and macOS (Darwin) only."
        exit 1
        ;;
esac

# Check if YADM installation was successful
if command -v yadm >/dev/null 2>&1; then
    echo "YADM installed successfully!"
    
    # Check environment variable
    if [ "${YADM_USE_SSH:-false}" = "true" ]; then
        REPO_URL="git@github.com:CovertDuck/node.dots.git"
        echo "Using SSH URL (set via YADM_USE_SSH=true)"
    else
        REPO_URL="https://github.com/CovertDuck/node.dots.git"
        echo "Using HTTPS URL (default)"
    fi

    # Clone the dotfiles repository
    echo "Cloning dotfiles repository..."
    yadm clone ${REPO_URL}
    
    if [ $? -eq 0 ]; then
        echo "Dotfiles repository cloned successfully!"
    else
        echo "Failed to clone dotfiles repository."
        exit 1
    fi
else
    echo "YADM installation failed."
    exit 1
fi

echo "Setup complete!"
