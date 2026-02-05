@echo off
setlocal EnableDelayedExpansion

set "USER=sanzekai"
set "REPO=terminal-ai"
:: Using the direct link you provided
set "DL_URL=https://github.com/sanzekai/terminal-ai/releases/download/v1.0.0/ask-win-x64.exe"
set "BIN_DIR=C:\sanzekai-cli"

echo 🚀 Starting Sanzekai AI installation for Windows...

:: 1. Create directory if it doesn't exist
if not exist "%BIN_DIR%" (
    mkdir "%BIN_DIR%"
)

echo 📥 Downloading binary...
:: Using -f to fail on 404 and -L to follow redirects
curl -L -f -o "%BIN_DIR%\ask.exe" "%DL_URL%"

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ❌ Download failed. 
    echo Please check if this link is public: %DL_URL%
    pause
    exit /b
)

:: 2. Add to PATH (Permanent)
echo %PATH% | findstr /I "%BIN_DIR%" >nul
if %ERRORLEVEL% NEQ 0 (
    echo ⚙️ Adding %BIN_DIR% to PATH...
    setx PATH "%PATH%;%BIN_DIR%" /M >nul 2>&1
    :: If /M (system wide) fails, try user path
    if %ERRORLEVEL% NEQ 0 setx PATH "%PATH%;%BIN_DIR%"
)

echo.
echo ✅ Installed successfully!
echo 💡 Please RESTART your terminal to use 'ask'.
pause

