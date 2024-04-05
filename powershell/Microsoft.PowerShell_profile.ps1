# PowerToys CommandNotFound module
Import-Module "$env:USERPROFILE\AppData\Local\PowerToys\WinGetCommandNotFound.psd1"

# PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# posh-git
Import-Module posh-git

# oh-my-posh
$omp_config = "$env:POSH_THEMES_PATH\amro.omp.json"
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression

# Terminal-Icons
Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# Fzf
# Import-Module PSFzf
# Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Env
$env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"

# Alias
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr


# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

# neovim
function run-nvim { $env:NVIM_APPNAME="nvim";nvim.exe $args }
function run-nvim-lazy {$env:NVIM_APPNAME="nvim-lazy";nvim.exe $args }
Set-Alias -Name vim -Value run-nvim
Set-Alias -Name nvim -Value run-nvim
Set-Alias -Name lvim -Value run-nvim-lazy
Set-Alias -Name lnvim -Value run-nvim-lazy

# vscode 
Set-Alias -Name code -Value code-insiders

# python venv (base)
Import-Module "$env:USERPROFILE\python\venv\base\Scripts\Activate.ps1"

