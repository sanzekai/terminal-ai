@echo off
set USER=sanzekai
set REPO=terminal-ai
set URL=https://github.com/%USER%/%REPO%/releases/latest/download/ask.exe

echo 🚀 Starting Sanzekai AI installation for Windows...

echo 📥 Downloading binary from GitHub...
powershell -Command "Invoke-WebRequest -Uri '%URL%' -OutFile 'ask.exe'"

echo 📂 Setting up system folders...
if not exist "C:\sanzekai-cli" mkdir "C:\sanzekai-cli"
move /y ask.exe "C:\sanzekai-cli\ask.exe"

echo 🌐 Registering to PATH environment variable...
setx PATH "%PATH%;C:\sanzekai-cli"

echo.
echo ✅ Installation Complete! Please restart your terminal and type 'ask'.
pause