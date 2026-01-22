#!/bin/bash
# Relay Helper Installer
# Usage: curl -fsSL https://raw.githubusercontent.com/Jaseunda/clips/main/releases/install.sh | bash

set -e

# ─────────────────────────────────────────────────────
# Configuration
# ─────────────────────────────────────────────────────

REPO_URL="https://github.com/Jaseunda/clips/raw/main/releases/latest"
INSTALL_DIR="$HOME/.relay/bin"
BRIDGE_DIR="$HOME/.relay"

# ─────────────────────────────────────────────────────
# Detection
# ─────────────────────────────────────────────────────

detect_platform() {
    OS="$(uname -s)"
    ARCH="$(uname -m)"

    case "$OS" in
        Darwin)
            case "$ARCH" in
                arm64) BINARY="relay-macos-arm64" ;;
                x86_64) BINARY="relay-macos-x64" ;;
                *) echo "Unsupported architecture: $ARCH"; exit 1 ;;
            esac
            ;;
        Linux)
            case "$ARCH" in
                x86_64) BINARY="relay-linux-x64" ;;
                aarch64) BINARY="relay-linux-arm64" ;;
                *) echo "Unsupported architecture: $ARCH"; exit 1 ;;
            esac
            ;;
        MINGW*|MSYS*|CYGWIN*)
            BINARY="relay-win-x64.exe"
            ;;
        *)
            echo "Unsupported OS: $OS"
            exit 1
            ;;
    esac

    echo "Detected: $OS ($ARCH) -> $BINARY"
}

# ─────────────────────────────────────────────────────
# Installation
# ─────────────────────────────────────────────────────

install_relay() {
    echo "Installing Relay Helper..."
    
    # Check for Python 3 (required for terminal)
    if ! command -v python3 &> /dev/null; then
        echo ""
        echo "⚠️  Python 3 is required for terminal functionality."
        echo ""
        case "$OS" in
            Darwin)
                echo "Install with: brew install python3"
                ;;
            Linux)
                echo "Install with: sudo apt install python3  (Debian/Ubuntu)"
                echo "          or: sudo dnf install python3  (Fedora)"
                ;;
        esac
        echo ""
        echo "Continuing installation anyway..."
    fi
    
    # Create directories
    mkdir -p "$INSTALL_DIR"
    mkdir -p "$BRIDGE_DIR"
    
    # Download binary
    echo "Downloading $BINARY..."
    curl -fsSL "$REPO_URL/$BINARY" -o "$INSTALL_DIR/relay"
    chmod +x "$INSTALL_DIR/relay"
    
    # Download bridge.py
    echo "Downloading bridge.py..."
    curl -fsSL "$REPO_URL/bridge.py" -o "$BRIDGE_DIR/bridge.py"
    
    echo "✓ Installed to $INSTALL_DIR/relay"
}

# ─────────────────────────────────────────────────────
# PATH Setup
# ─────────────────────────────────────────────────────

setup_path() {
    SHELL_NAME="$(basename "$SHELL")"
    
    case "$SHELL_NAME" in
        zsh)  RC_FILE="$HOME/.zshrc" ;;
        bash) RC_FILE="$HOME/.bashrc" ;;
        *)    RC_FILE="$HOME/.profile" ;;
    esac
    
    PATH_LINE='export PATH="$HOME/.relay/bin:$PATH"'
    
    if ! grep -q ".relay/bin" "$RC_FILE" 2>/dev/null; then
        echo "" >> "$RC_FILE"
        echo "# Relay Helper" >> "$RC_FILE"
        echo "$PATH_LINE" >> "$RC_FILE"
        echo "✓ Added to PATH in $RC_FILE"
        echo ""
        echo "Run this to use relay now:"
        echo "  source $RC_FILE"
    else
        echo "✓ PATH already configured"
    fi
}

# ─────────────────────────────────────────────────────
# Main
# ─────────────────────────────────────────────────────

main() {
    echo ""
    echo "╔═══════════════════════════════════════╗"
    echo "║      Relay Helper Installer           ║"
    echo "╚═══════════════════════════════════════╝"
    echo ""
    
    detect_platform
    install_relay
    setup_path
    
    echo ""
    echo "✓ Installation complete!"
    echo ""
    echo "Get started:"
    echo "  relay start    # Start the helper"
    echo "  relay status   # Check status"
    echo "  relay help     # Show all commands"
    echo ""
}

main
