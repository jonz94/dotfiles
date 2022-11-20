# improve powershell performance
$ProgressPreference = 'SilentlyContinue'

# setup git
git config --global user.name 'jonz94'
git config --global user.email 'jody16888@gmail.com'
git config --global pull.rebase true
git config --global init.defaultBranch main

# create local profile if it does not exist
$localScript = Join-Path $PSScriptRoot 'local\local.ps1'
if (-not $(Test-Path $localScript -PathType Leaf)) {
  New-Item $localScript -ItemType File -Force *> $null
}

# create $PROFILE file if it does not exists
if (-not $(Test-Path $PROFILE -PathType Leaf)) {
  New-Item $PROFILE -ItemType File -Force *> $null
}

# source main profile
if (-not $(Select-String -Path $PROFILE -Pattern '^\. \$HOME\\dotfiles\\powershell\\jonz94\.ps1$')) {
  Add-Content $PROFILE -Encoding UTF8 -Value '. $HOME\dotfiles\powershell\jonz94.ps1'
}

# source local profile
if (-not $(Select-String -Path $PROFILE -Pattern '^\. \$HOME\\dotfiles\\local\\local\.ps1$')) {
  Add-Content $PROFILE -Encoding UTF8 -Value '. $HOME\dotfiles\local\local.ps1'
}

$currentScoopBucketList = $(scoop bucket list).Name

if (-not $currentScoopBucketList.Contains('main')) {
  scoop bucket add main
}

if (-not $currentScoopBucketList.Contains('nerd-fonts')) {
  scoop bucket add nerd-fonts
}

if (-not $currentScoopBucketList.Contains('sarasa-nerd-fonts')) {
  scoop bucket add sarasa-nerd-fonts https://github.com/jonz94/scoop-sarasa-nerd-fonts
}

if (-not $currentScoopBucketList.Contains('jonz94')) {
  scoop bucket add jonz94 https://github.com/jonz94/scoop-personal
}

# install oh-my-posh
if (-not $(scoop which oh-my-posh)) {
  scoop install oh-my-posh
}

# install gsudo
if (-not $(scoop which gsudo)) {
  scoop install gsudo
}

# install neovim bare nightly
if (-not $(scoop which nvim)) {
  scoop install neovim-bare-nightly
}

# install fzf
if (-not $(scoop which fzf)) {
  scoop install fzf
}

# install fnm
if (-not $(scoop which fnm)) {
  scoop install fnm
}

# install zoxide
if (-not $(scoop which zoxide)) {
  scoop install zoxide
}

# install busybox-lean
if (-not $(scoop which busybox)) {
  scoop install busybox-lean
}

# install ripgrep
if (-not $(scoop which ripgrep)) {
  scoop install ripgrep
}

# install grep
if (-not $(scoop which grep)) {
  scoop install grep
}

# install less
if (-not $(scoop which less)) {
  scoop install less
}

# install sed
if (-not $(scoop which sed)) {
  scoop install sed
}

# install Sarasa Gothic fonts
if (-not $(scoop which SarasaGothic-ttc)) {
  scoop install SarasaGothic-ttc
}

# install Sarasa Mono TC Nerd Font
if (-not $(scoop which sarasa-mono-tc-nerd-font)) {
  scoop install sarasa-mono-tc-nerd-font
}

# add scoop commmand aliases
scoop alias add upgrade 'scoop update --all' 'Updates all apps, just like brew or apt'
scoop alias add reinstall 'scoop uninstall $args[0]; scoop install $args[0]' 'Reinstall an app'

Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted

# install posh-git module
if ( (-not $(Get-InstalledModule)) -or (-not $(Get-InstalledModule).Name.contains('posh-git')) ) {
  Install-Module 'posh-git' -Scope CurrentUser
}

# install Terminal-Icons module
if ( (-not $(Get-InstalledModule)) -or (-not $(Get-InstalledModule).Name.contains('Terminal-Icons')) ) {
  Install-Module 'Terminal-Icons' -Scope CurrentUser
}

# load fnm & generate fnm's completions file
$fnmCompletionsPs1Path = Join-Path $PSScriptRoot 'powershell\completions\_fnm.completions.ps1'

if (-not $(Test-Path $fnmCompletionsPs1Path -PathType Leaf)) {
  $commands = @'
    Set-ExecutionPolicy RemoteSigned -scope CurrentUser
    fnm env --use-on-cd | Out-String | Invoke-Expression
    fnm completions --shell powershell
'@

  powershell.exe -NoProfile -Command "$commands > $fnmCompletionsPs1Path"
}

$setupNodejsEnvironmentViaFnmCommands = @'
  Set-ExecutionPolicy RemoteSigned -scope CurrentUser
  fnm env --use-on-cd | Out-String | Invoke-Expression
  fnm install --lts
  fnm alias lts-latest default
  npm i -g npm@latest
  npm rm -g corepack
  npm i -g pnpm@latest rimraf@latest yarn@latest
'@

powershell.exe -NoProfile -Command $setupNodejsEnvironmentViaFnmCommands

Write-Host "`nINFO: execute following script to setup neovim:`n" -ForegroundColor Cyan
Write-Host "    .\powershell\scripts\setup-neovim.ps1`n" -ForegroundColor Blue

Write-Host "`nINFO: execute following script to setup vscode snippets:`n" -ForegroundColor Cyan
Write-Host "    .\powershell\scripts\setup-vscode-snippets.ps1`n" -ForegroundColor Blue

Write-Host 'Done! 🎉'
