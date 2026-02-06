# 🤖 Terminal AI (ask)

A lightweight CLI tool to interact with Google Gemini directly from your terminal. Built with Go, designed for speed and simplicity.

## 🚀 Quick Installation

Choose your Operating System and run the command in your terminal. No browser required.

### 🐧 Linux & 🍎 macOS

```bash
curl -sSL https://raw.githubusercontent.com/sanzekai/terminal-ai/main/install.sh | bash
```

### 🪟 Windows (PowerShell Admin)

```powershell
iwr https://raw.githubusercontent.com/sanzekai/terminal-ai/main/install.bat -OutFile install.bat; .\install.bat
```

## 🔑 Configuration (API Key)

You need a Google Gemini API Key. Get one for free at Google AI Studio.

Set it up with one command:

### Linux (Bash/Zsh):

```Bash
echo 'export GEMINI_API_KEY="your_api_key_here"' >> ~/.bashrc && source ~/.bashrc
```

### macOS (Zsh):

```Bash
echo 'export GEMINI_API_KEY="your_api_key_here"' >> ~/.zshrc && source ~/.zshrc
```

### Windows (PowerShell):

```PowerShell
[System.Environment]::SetEnvironmentVariable('GEMINI_API_KEY', 'your_api_key_here', 'User')
```

> Note: Run as administrator and restart your terminal after setting the key on Windows.

## 🛠️ Usage

Once installed, you can use the ask command from anywhere:

1. General Questions

```Bash
ask "how to download more ram?"
```

2. Installation Helper
   Get the exact installation command for any app across different OS.

```Bash
ask --install docker
```

## sanzekai.com
