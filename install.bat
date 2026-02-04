@echo off
set "USER=sanzekai"
set "REPO=terminal-ai"
set "URL=https://github.com/%USER%/%REPO%/releases/latest/download/ask.exe"

echo 🚀 Starting Sanzekai AI installation for Windows...

echo 📥 Downloading binary from GitHub...
powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri '%URL%' -OutFile 'ask.exe'"

if exist ask.exe (
    echo 📂 Setting up system folders...
    if not exist "C:\sanzekai-cli" mkdir "C:\sanzekai-cli"
    move /y ask.exe "C:\sanzekai-cli\ask.exe"
    
    echo 🌐 Registering to PATH...
    setx PATH "%PATH%;C:\sanzekai-cli"
    
    echo.
    echo ✅ Done! Please restart your terminal and type 'ask'.
) else (
    echo ❌ Download failed! Make sure your internet is stable.
) 
pause