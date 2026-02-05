@echo off
set "USER=sanzekai"
set "REPO=terminal-ai"
set "URL=https://github.com/%USER%/%REPO%/releases/latest/download/ask.exe"

echo 🚀 Starting Sanzekai AI installation for Windows...

echo 📥 Downloading binary from GitHub...
curl -L -o ask.exe "%URL%"

if exist ask.exe (
    echo 📂 Setting up system folders...
    if not exist "C:\sanzekai-cli" mkdir "C:\sanzekai-cli"
    move /y ask.exe "C:\sanzekai-cli\ask.exe"
    
    echo 🌐 Registering to PATH...
    setx PATH "%PATH%;C:\sanzekai-cli" >nul
    
    echo.
    echo ✅ Done! Restart terminal then type: ask
) else (
    echo ❌ Download failed! Check internet or release file.
)

pause
