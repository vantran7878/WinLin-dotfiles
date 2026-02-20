# ==========================================
# Windows Dev Environment Bootstrap Script (Scoop Version)
# ==========================================

Write-Host "🚀 Starting bootstrap with Scoop..."

# 1️⃣ Ensure Scoop is installed
if (!(Get-Command scoop -ErrorAction SilentlyContinue)) {
    Write-Host "📥 Scoop not found. Installing Scoop..."
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
}

# 2️⃣ Add necessary buckets
Write-Host "🪣 Adding buckets..."
scoop bucket add extras     # Needed for VS Code and AHK
scoop bucket add main       # Default, but good to ensure

# 3️⃣ Install Apps
$apps = @(
    "git",
    "neovim",
    "vscode",
    "oh-my-posh",
    "autohotkey"
)

foreach ($app in $apps) {
    Write-Host "Installing $app..."
    scoop install $app
}

# 4️⃣ Clone dotfiles repo
if (!(Test-Path "$HOME\dotfiles")) {
    Write-Host "📂 Cloning dotfiles..."
    git clone https://github.com/vantran7878/dotfiles.git $HOME\dotfiles
}

# 5️⃣ Run install script
cd $HOME\dotfiles
.\install.ps1

Write-Host "✅ Bootstrap complete!"