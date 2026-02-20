# Window 11 dotfiles with Linux-like config

This is the dotfiles of myself, being obsessed with Linux set up: Wayland, shell, vim, bars but not having the ability of using Linux. (I don't have wifi driver compatible with any Linux distro 🥲🥲). You can refered this as a Linux wayland simulator.

## Window environment and tools dependencies
These are the environment and dependencies your need to install in order to have a Linux like environment with Wayland setup. 

1. Window 11 x86_64
2. Komorebi version 2.0 or above
3. YASB
4. Neovim
5. Visual Studio Code
6. Powershell with Oh-My-Posh setup
7. AutoHotkey
8. Scoop (optional but preferred)
9. Git

Install required tools through **Scoop**:

```pwsh
iwr -useb get.scoop.sh | iex
scoop install git neovim vscode oh-my-posh
```

or **Winget**:

```
winget install Git.Git Neovim.Neovim Microsoft.VisualStudioCode JanDeDobbeleer.OhMyPosh AutoHotkey.AutoHotkey
```


## Installation
For a full installation, run these command in **Winget** to have all apps required:

```powershell
irm https://raw.githubusercontent.com/vantran7878/WinLin-dotfiles/main/winget_bootstrap.ps1 | iex
```

or in **Scoop**:

```powershell
irm https://raw.githubusercontent.com/vantran7878/WinLin-dotfiles/main/scoop_bootstrap.ps1 | iex
```

Then clone my setup file by symlink through this command:

```powershell
irm https://raw.githubusercontent.com/vantran7878/WinLin-dotfiles/main/install.ps1 | iex
```

If you want to clone the repository and copy files to your equivalent directory.

```powershell
git clone https://github.com/vantran7878/WinLin-dotfiles.git $HOME\dotfiles
cd $HOME\dotfiles
.\install.ps1
```

In details, this is the setup for each tools:

### Window manager
We need a Tiling window manager in order to have the exact same felling of the Wayland (Sway, hyprland,...), in Windows, we have Komorebi. After install Komorebi, a setup 






## Galery