#!/usr/bin/env sh

if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    if command -v brew >/dev/null 2>&1; then
        brew install yadm
    else
        echo "Homebrew not found. Please install Homebrew first."
        exit 1
    fi
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    if command -v apt >/dev/null 2>&1; then
        sudo apt update && sudo apt install -y yadm
    else
        echo "apt not found. This script supports Debian/Ubuntu-based systems."
        exit 1
    fi
else
    echo "Unsupported operating system: $OSTYPE"
    exit 1
fi

yadm clone https://github.com/CovertDuck/node.dots.git
