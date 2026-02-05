@echo off
setlocal

:: Konfigurasi
set "USER=sanzekai"
set "REPO=terminal-ai"
set "TAG=v1.0.0"
set "URL=https://github.com/%USER%/%REPO%/releases/download/%TAG%/ask-win-x64.exe"
set "FOLDER=C:\sanzekai-cli"

echo 🚀 Memulai instalasi Sanzekai AI untuk Windows...

:: 1. Buat folder kalau belum ada
if not exist "%FOLDER%" (
    echo 📂 Membuat direktori %FOLDER%...
    mkdir "%FOLDER%"
)

:: 2. Hapus file lama kalau ada (biar nggak bentrok/permission denied)
if exist "%FOLDER%\ask.exe" (
    del /f /q "%FOLDER%\ask.exe" >nul 2>&1
)

echo 📥 Sedang mengunduh binary dari GitHub...
:: Pakai kutip di "%URL%" supaya nggak error kalau ada karakter spesial
curl -L -f -o "%FOLDER%\ask.exe" "%URL%"

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ❌ Download gagal! Cek koneksi atau link GitHub kamu:
    echo %URL%
    pause
    exit /b
)

:: 3. Masukkan ke PATH supaya bisa dipanggil 'ask' dari mana saja
echo %PATH% | findstr /I "%FOLDER%" >nul
if %ERRORLEVEL% NEQ 0 (
    echo ⚙️ Menambahkan %FOLDER% ke PATH...
    setx PATH "%PATH%;%FOLDER%"
)

echo.
echo ✅ Berhasil Terpasang! 
echo 💡 RESTART Terminal (atau VS Code) kamu, lalu ketik: ask
pause
