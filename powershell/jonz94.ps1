# utf-8 for printing
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# improve powershell performance
$ProgressPreference = 'SilentlyContinue'

# opt-out powershell telemetry
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_telemetry
$env:POWERSHELL_TELEMETRY_OPTOUT = 'yes'

# disable less history file
$env:LESSHISTFILE = '-'

# oh my posh
# https://github.com/JanDeDobbeleer/oh-my-posh
# enable posh-git module
$env:POSH_GIT_ENABLED = $true
# disable Az.Accounts module
$env:AZ_ENABLED = $false
if ( $(scoop which oh-my-posh) ) {
  $config = Join-Path $PSScriptRoot 'jonz94.omp.json'
  Invoke-Expression (oh-my-posh --init --shell pwsh --config $config)
}

# terminal icons for powershell
# https://github.com/devblackops/Terminal-Icons
Import-Module 'Terminal-Icons'

# use Emacs mode, just like unix-y environment
Set-PSReadLineOption -EditMode Emacs

# no more beep
Set-PSReadLineOption -BellStyle None

# make shell history cleaner
Set-PSReadLineOption -HistoryNoDuplicate

# show predictive suggestions from command history
Set-PSReadLineOption -PredictionSource History

# any command with spaces or tabs at the beginning of the line is not added to the PSReadLine history
# credit: https://github.com/PowerShell/PowerShell/issues/10403#issuecomment-523833700
Set-PSReadLineOption -AddToHistoryHandler {
  param($line)
  $line -notmatch '^\s+'
}

# print out PSReadline history instead of using powershell's Get-History
Remove-Item Alias:\history -Force *> $null
function history {
  Get-Content (Get-PSReadLineOption).HistorySavePath
}

# edit PSReadLine history file via vscode
function edit-history {
  code (Get-PSReadLineOption).HistorySavePath
}

# ctrl + shift + v for paste
Set-PSReadLineKeyHandler -Key Ctrl+V -Function Paste

# load fnm
if ( $(scoop which fnm) ) {
  fnm env --use-on-cd | Out-String | Invoke-Expression
}

# load zoxide
if ( $(scoop which zoxide) ) {
  $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
  Invoke-Expression (& { (zoxide init --hook $hook powershell) -join "`n" })
}

# test if current powershell is running with administrator privileges
function Test-Administrator {
  $user = [Security.Principal.WindowsIdentity]::GetCurrent()
  $admin = [Security.Principal.WindowsBuiltinRole]::Administrator
  (New-Object Security.Principal.WindowsPrincipal $user).IsInRole($admin)
}

# aliases
Join-Path $PSScriptRoot 'aliases' | Get-ChildItem -File -Filter '*.ps1' | ForEach-Object {
  . $_.FullName
}

# completions
Join-Path $PSScriptRoot 'completions' | Get-ChildItem -File -Filter '*.ps1' | ForEach-Object {
  . $_.FullName
}

# settings
Join-Path $PSScriptRoot 'settings' | Get-ChildItem -File -Filter '*.ps1' | ForEach-Object {
  . $_.FullName
}

# add backwards compatibility for older powershell
if ( $HOST.Version.Major -ge 7 ) {
  # only source this profile when powershell major version number is >= 7
  . $(Join-Path $PSScriptRoot 'pwsh.ps1')
} else {
  function gpoat {
    if ( $(git push origin --all) ) {
      git push origin --tags
    }
  }

  function sud { scoop update; scoop status }
  function ud { scoop update; scoop status }
}
