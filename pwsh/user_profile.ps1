# Prompt
Import-Module posh-git
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\paradox.omp.json" | Invoke-Expression
# Alias
Set-Alias vim nvim
Set-Alias ll ls
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'


function shutdown {
    param(
        [string]$arg
    )

    if ($arg -eq "now") {
        shutdown.exe /s /t 0
    } else {
        Write-Host "Usage: shutdown now"
    }
}

function reboot {
    $confirm = Read-Host "Are you sure you want to reboot? (y/n)"
    if ($confirm -eq "y") {
        shutdown.exe /r /t 0
    } else {
        Write-Host "Reboot canceled."
    }
}

function touch {
    param(
        [string]$Path
    )
    if (-not (Test-Path -Path $Path)) {
        New-Item -Path $Path -ItemType File | Out-Null
    } else {
        (Get-Item $Path).LastWriteTime = Get-Date
    }
}
