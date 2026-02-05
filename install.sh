#!/bin/bash
set -e  # Stop kalau ada error

USER="sanzekai"
REPO="terminal-ai"
BINARY_NAME="ask"

echo "🚀 Installing $BINARY_NAME from $USER/$REPO..."

# Detect OS
OS_TYPE=$(uname -s)
ARCH_TYPE=$(uname -m)

case "$OS_TYPE" in
  Darwin) OS="mac";;
  Linux)  OS="linux";;
  *) echo "❌ Unsupported OS"; exit 1;;
esac

# Detect Architecture
case "$ARCH_TYPE" in
  x86_64) ARCH="x64";;
  arm64|aarch64) ARCH="arm64";;
  *) echo "❌ Unsupported architecture"; exit 1;;
esac

URL="https://github.com/$USER/$REPO/releases/latest/download/${BINARY_NAME}-${OS}-${ARCH}"

echo "💻 OS: $OS | 🧠 ARCH: $ARCH"
echo "📥 Downloading..."

if ! command -v curl &> /dev/null; then
    echo "❌ curl not installed"
    exit 1
fi

curl -fL -o $BINARY_NAME "$URL"

chmod +x $BINARY_NAME

INSTALL_DIR="/usr/local/bin"
echo "📂 Installing to $INSTALL_DIR (sudo needed)..."
sudo mv $BINARY_NAME "$INSTALL_DIR/$BINARY_NAME"

echo "✅ Done. Run '$BINARY_NAME' anywhere."
