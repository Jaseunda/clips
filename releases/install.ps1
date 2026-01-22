# Relay Helper Installer for Windows
# Usage: iwr -useb https://raw.githubusercontent.com/Jaseunda/clips/main/releases/install.ps1 | iex

$ErrorActionPreference = "Stop"

# ─────────────────────────────────────────────────────
# Configuration
# ─────────────────────────────────────────────────────

$REPO_URL = "https://github.com/Jaseunda/clips/raw/main/releases/latest"
$BINARY = "relay-win-x64.exe"
$INSTALL_DIR = "$env:USERPROFILE\.relay\bin"
$BRIDGE_DIR = "$env:USERPROFILE\.relay"

# ─────────────────────────────────────────────────────
# Installation
# ─────────────────────────────────────────────────────

Write-Host ""
Write-Host "╔═══════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║      Relay Helper Installer           ║" -ForegroundColor Cyan
Write-Host "╚═══════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# Create directories
New-Item -ItemType Directory -Force -Path $INSTALL_DIR | Out-Null
New-Item -ItemType Directory -Force -Path $BRIDGE_DIR | Out-Null

# Download binary
Write-Host "Downloading $BINARY..."
Invoke-WebRequest -Uri "$REPO_URL/$BINARY" -OutFile "$INSTALL_DIR\relay.exe"

# Download bridge.py
Write-Host "Downloading bridge.py..."
Invoke-WebRequest -Uri "$REPO_URL/bridge.py" -OutFile "$BRIDGE_DIR\bridge.py"

Write-Host "✓ Installed to $INSTALL_DIR\relay.exe" -ForegroundColor Green

# ─────────────────────────────────────────────────────
# PATH Setup
# ─────────────────────────────────────────────────────

$CurrentPath = [Environment]::GetEnvironmentVariable("PATH", "User")
if ($CurrentPath -notlike "*\.relay\bin*") {
    $NewPath = "$INSTALL_DIR;$CurrentPath"
    [Environment]::SetEnvironmentVariable("PATH", $NewPath, "User")
    Write-Host "✓ Added to PATH" -ForegroundColor Green
    Write-Host ""
    Write-Host "Restart your terminal to use 'relay' command" -ForegroundColor Yellow
} else {
    Write-Host "✓ PATH already configured" -ForegroundColor Green
}

Write-Host ""
Write-Host "✓ Installation complete!" -ForegroundColor Green
Write-Host ""
Write-Host "Get started:"
Write-Host "  relay start    # Start the helper"
Write-Host "  relay status   # Check status"
Write-Host "  relay help     # Show all commands"
Write-Host ""
