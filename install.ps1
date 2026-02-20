# Clone repo
git clone https://github.com/vantran7878/WinLin-dotfiles.git $HOME\dotfiles

# ==========================================
# Dotfiles Install Script
# ==========================================

Write-Host "🔧 Installing dotfiles..."

$DOTFILES = "$HOME\dotfiles"

function New-Symlink {
    param (
        [string]$Target,
        [string]$LinkPath
    )

    if (Test-Path $LinkPath) {
        Write-Host "⚠ Removing existing: $LinkPath"
        Remove-Item $LinkPath -Recurse -Force
    }

    Write-Host "🔗 Linking $LinkPath -> $Target"
    New-Item -ItemType SymbolicLink -Path $LinkPath -Target $Target | Out-Null
}

# =========================
# 🐚 PowerShell Profile
# =========================

$pwshProfileDir = Split-Path $PROFILE -Parent

if (!(Test-Path $pwshProfileDir)) {
    New-Item -ItemType Directory -Path $pwshProfileDir | Out-Null
}

New-Symlink `
    "$DOTFILES\pwsh\Microsoft.PowerShell_profile.ps1" `
    $PROFILE

# =========================
# 🎨 Oh My Posh Theme
# =========================

$ompThemeTarget = "$DOTFILES\pwsh\theme.omp.json"
$ompThemeLink   = "$HOME\.omp.json"

if (Test-Path $ompThemeTarget) {
    New-Symlink $ompThemeTarget $ompThemeLink
}

# =========================
# 📝 Neovim
# =========================

New-Symlink `
    "$DOTFILES\nvim" `
    "$env:LOCALAPPDATA\nvim"

# =========================
# 💻 VSCode Settings
# =========================

$vscodeUserDir = "$env:APPDATA\Code\User"

New-Symlink `
    "$DOTFILES\vscode\settings.json" `
    "$vscodeUserDir\settings.json"

New-Symlink `
    "$DOTFILES\vscode\keybindings.json" `
    "$vscodeUserDir\keybindings.json"

# Install extensions
if (Test-Path "$DOTFILES\vscode\extensions.txt") {
    Write-Host "📦 Installing VSCode extensions..."
    Get-Content "$DOTFILES\vscode\extensions.txt" | ForEach-Object {
        code --install-extension $_ --force
    }
}

# =========================
# 🪟 komorebi
# =========================

New-Symlink `
    "$DOTFILES\komorebi\komorebi.json" `
    "$HOME\komorebi.json"

# =========================
# 📊 YASB
# =========================

New-Symlink `
    "$DOTFILES\yasb" `
    "$HOME\.config\yasb"

# =========================
# ⌨️ AutoHotkey
# =========================

New-Symlink `
    "$DOTFILES\ahk\main.ahk" `
    "$HOME\main.ahk"

Write-Host "✅ Dotfiles installation complete!"