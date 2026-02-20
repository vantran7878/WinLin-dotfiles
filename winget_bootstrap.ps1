# ==========================================
# Windows Dev Environment Bootstrap Script
# ==========================================

Write-Host "🚀 Starting bootstrap..."

# 1️⃣ Install Winget apps 

$apps = @(
    "Git.Git",
    "Neovim.Neovim",
    "Microsoft.VisualStudioCode",
    "JanDeDobbeleer.OhMyPosh",
    "AutoHotkey.AutoHotkey"
)

foreach ($app in $apps) {
    Write-Host "Installing $app..."
    winget install --id $app -e --source winget --accept-package-agreements --accept-source-agreements
}

# 2️⃣ Clone dotfiles repo

if (!(Test-Path "$HOME\dotfiles")) {
    git clone https://github.com/vantran7878/dotfiles.git $HOME\dotfiles
}

# 3️⃣ Run install script

cd $HOME\dotfiles
.\install.ps1

Write-Host "✅ Bootstrap complete!"