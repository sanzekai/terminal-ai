@echo off
set "USER=sanzekai"
set "REPO=terminal-ai"
:: Get the latest tag name first or use the direct download link
set "URL=https://github.com/%USER%/%REPO%/releases/download/v1.0.0/ask-win-x64.exe"
set "INSTALL_DIR=C:\sanzekai-cli"

echo 🚀 Starting Sanzekai AI installation for Windows...

:: Kill the process if it's already running to avoid "Permission Denied"
taskkill /F /IM ask.exe >nul 2>&1

echo 📥 Downloading binary...
:: -L follows redirects, -f fails silently on server errors
curl -L -f -o ask_new.exe "%URL%"

if %ERRORLEVEL% NEQ 0 (
    echo ❌ Download failed. Check your URL or Internet.
    pause
    exit /b
)

if not exist "%INSTALL_DIR%" mkdir "%INSTALL_DIR%"

:: Move the new file to the destination
move /y ask_new.exe "%INSTALL_DIR%\ask.exe"

:: Add to PATH only if it's not already there
echo %PATH% | findstr /I "%INSTALL_DIR%" >nul
if %ERRORLEVEL% NEQ 0 (
    setx PATH "%PATH%;%INSTALL_DIR%"
    echo ➕ Added to PATH.
)

echo.
echo ✅ Success! Restart your terminal and run: ask
pause
