#!/usr/bin/env sh

# Get OS type using uname since $OSTYPE is bash-specific
os_type=$(uname -s)

case "$os_type" in
    Darwin)
        # macOS
        if command -v brew >/dev/null 2>&1; then
            brew install yadm
        else
            echo "Homebrew not found. Please install Homebrew first."
            exit 1
        fi
        ;;
    Linux)
        # Linux
        if command -v apt >/dev/null 2>&1; then
            sudo apt update && sudo apt install -y yadm
        else
            echo "apt not found. This script supports Debian/Ubuntu-based systems."
            exit 1
        fi
        ;;
    *)
        echo "Unsupported operating system: $os_type"
        exit 1
        ;;
esac

yadm clone https://github.com/CovertDuck/node.dots.git
