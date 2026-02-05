@echo off
set "USER=sanzekai"
set "REPO=terminal-ai"
set "URL=https://github.com/%USER%/%REPO%/releases/latest/download/ask.exe"

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

