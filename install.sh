#!/bin/bash

# Sanzekai GitHub Config
USER="sanzekai"
REPO="terminal-ai"
BINARY_NAME="ask"

echo "🚀 Starting installation of $BINARY_NAME from $USER/$REPO..."

# 1. OS Detection
OS_TYPE=$(uname -s | tr '[:upper:]' '[:lower:]')
if [ "$OS_TYPE" == "darwin" ]; then
    URL="https://github.com/$USER/$REPO/releases/latest/download/ask-mac"
    echo "💻 Detected OS: macOS"
else
    URL="https://github.com/$USER/$REPO/releases/latest/download/ask-linux"
    echo "🐧 Detected OS: Linux"
fi

# 2. Download Binary
echo "📥 Downloading pre-compiled binary..."
curl -L -o $BINARY_NAME $URL

# 3. Setup and Move
chmod +x $BINARY_NAME
echo "📂 Moving binary to /usr/local/bin (sudo required)..."
sudo mv $BINARY_NAME /usr/local/bin/$BINARY_NAME

echo "✅ Success! You can now use '$BINARY_NAME' anywhere in your terminal."