# setting up git
git config --global user.name "jonz94"
git config --global user.email "jody16888@gmail.com"
git config --global pull.rebase false
git config --global init.defaultBranch main

# Create local profile if it does not exist
if (-not $(Test-Path "$HOME\dotfiles\local\local.ps1" -PathType Leaf)) {
  New-Item "$HOME\dotfiles\local\local.ps1" -ItemType File -Force *> $null
}

# Create $PROFILE file if it does not exists
if (-not $(Test-Path $PROFILE -PathType Leaf)) {
  New-Item $PROFILE -ItemType File -Force *> $null
}

# Source main profile
if (-not $(Select-String -Path $PROFILE -Pattern '^\. \$HOME\\dotfiles\\powershell\\jonz94\.ps1$')) {
  Add-Content $PROFILE -Encoding UTF8 -Value '. $HOME\dotfiles\powershell\jonz94.ps1'
}

# Source local profile
if (-not $(Select-String -Path $PROFILE -Pattern '^\. \$HOME\\dotfiles\\local\\local\.ps1$')) {
  Add-Content $PROFILE -Encoding UTF8 -Value '. $HOME\dotfiles\local\local.ps1'
}

# Install oh-my-posh3
if (-not $(scoop which oh-my-posh)) {
  scoop install oh-my-posh3
}

# Install neovim
if (-not $(scoop which nvim)) {
  scoop install neovim
}

$initDotVimPath = "$HOME\AppData\Local\nvim\init.vim"

# Create neovim's init.vim if it does not exist
if (-not $(Test-Path $initDotVimPath -PathType Leaf)) {
  New-Item $initDotVimPath -ItemType File -Force *> $null
}

if (-not $(Select-String -Path $PROFILE -Pattern '^source \$HOME\/dotfiles\/nvim\/jonz94\.vim$')) {
  Add-Content $initDotVimPath -Encoding UTF8 -Value 'source $HOME/dotfiles/nvim/jonz94.vim'
}

$ginitDotVimPath = "$HOME\AppData\Local\nvim\ginit.vim"

# Create neovim's ginit.vim if it does not exists
if (-not $(Test-Path $ginitDotVimPath -PathType Leaf)) {
  New-Item $ginitDotVimPath -ItemType File -Force *> $null
}

if (-not $(Select-String -Path $PROFILE -Pattern '^\source \$HOME\/dotfiles\/nvim\/jonz94\.gvim$')) {
  Add-Content $ginitDotVimPath -Encoding UTF8 -Value 'source $HOME/dotfiles/nvim/jonz94.gvim'
}

$plugDotVimPath = "$HOME\AppData\Local\nvim\autoload\plug.vim"

# Install vim-plug
if (-not $(Test-Path $plugDotVimPath -PathType Leaf)) {
  md ~\AppData\Local\nvim\autoload
  $uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  (New-Object Net.WebClient).DownloadFile(
    $uri,
    $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
      $plugDotVimPath
    )
  )
}

# Install vim plugins
nvim.exe -c PlugInstall -c qa

# Install fzf
if (-not $(scoop which fzf)) {
  scoop install fzf
}

# Install fnm
if (-not $(scoop which fnm)) {
  scoop install fnm
}

# Install zoxide
if (-not $(scoop which zoxide)) {
  scoop install zoxide
}

# Install posh-git modules
if ( (-not $(Get-InstalledModule)) -or (-not $(Get-InstalledModule).Name.contains('posh-git')) ) {
  Install-Module 'posh-git' -Scope CurrentUser
}

# Install PSFzf modules
if ( (-not $(Get-InstalledModule)) -or (-not $(Get-InstalledModule).Name.contains('PSFzf')) ) {
  Install-Module 'PSFzf' -Scope CurrentUser
}

# Load fnm & generate fnm's completions file
$fnmCompletionsPs1Path = "$HOME\dotfiles\powershell\completions\fnm.completions.ps1"
if (-not $(Test-Path $fnmCompletionsPs1Path -PathType Leaf)) {
  powershell.exe -NoProfile -Command "fnm env --use-on-cd | Out-String | Invoke-Expression; fnm completions --shell powershell > $fnmCompletionsPs1Path"
}
