@echo off
set "USER=sanzekai"
set "REPO=terminal-ai"
set "https://github.com/%USER%/%REPO%/releases/download/v1.0.0/ask-win-x64.exe"

echo 🚀 Starting Sanzekai AI installation for Windows...

echo 📥 Downloading binary...
curl -L -o ask.exe "%URL%"

if not exist ask.exe (
    echo ❌ Download failed.
    pause
    exit /b
)

if not exist "C:\sanzekai-cli" mkdir "C:\sanzekai-cli"
move /y ask.exe "C:\sanzekai-cli\ask.exe"

setx PATH "%PATH%;C:\sanzekai-cli" >nul

echo.
echo ✅ Installed! Restart terminal and run: ask
pause



