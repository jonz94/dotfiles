# setting up git
git config --global user.name 'jonz94'
git config --global user.email 'jody16888@gmail.com'
git config --global pull.rebase true
git config --global init.defaultBranch main

# create local profile if it does not exist
$localScript = Join-Path $PSScriptRoot 'local' 'local.ps1'
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

# install oh-my-posh3
if (-not $(scoop which oh-my-posh)) {
  scoop install oh-my-posh3
}

# install neovim
if (-not $(scoop which nvim)) {
  scoop install neovim
}

$neovimUserDataDirectory = Join-Path $env:LOCALAPPDATA 'nvim'
$initDotVimPath = Join-Path $neovimUserDataDirectory 'init.vim'

# create neovim's init.vim if it does not exist
if (-not $(Test-Path $initDotVimPath -PathType Leaf)) {
  New-Item $initDotVimPath -ItemType File -Force *> $null
}

if (-not $(Select-String -Path $PROFILE -Pattern '^source \$HOME\/dotfiles\/nvim\/jonz94\.vim$')) {
  Add-Content $initDotVimPath -Encoding UTF8 -Value 'source $HOME/dotfiles/nvim/jonz94.vim'
}

$ginitDotVimPath = Join-Path $neovimUserDataDirectory 'ginit.vim'

# create neovim's ginit.vim if it does not exists
if (-not $(Test-Path $ginitDotVimPath -PathType Leaf)) {
  New-Item $ginitDotVimPath -ItemType File -Force *> $null
}

if (-not $(Select-String -Path $PROFILE -Pattern '^\source \$HOME\/dotfiles\/nvim\/jonz94\.gvim$')) {
  Add-Content $ginitDotVimPath -Encoding UTF8 -Value 'source $HOME/dotfiles/nvim/jonz94.gvim'
}

$neovimAutoloadDirectory = Join-Path $neovimUserDataDirectory 'autoload'
$plugDotVimPath = Join-Path $neovimAutoloadDirectory 'plug.vim'

# install vim-plug
if (-not $(Test-Path $plugDotVimPath -PathType Leaf)) {
  New-Item $neovimAutoloadDirectory -ItemType Directory -ErrorAction SilentlyContinue
  $uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  (New-Object Net.WebClient).DownloadFile(
    $uri,
    $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
      $plugDotVimPath
    )
  )
}

# install vim plugins
nvim.exe -c PlugInstall -c qa

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
# Note: the `sed` command provided by busybox is better when using `-i` flag
if (-not $(scoop which busybox)) {
  scoop install busybox-lean
}

# install less
if (-not $(scoop which less)) {
  scoop install less
}

# install posh-git module
if ( (-not $(Get-InstalledModule)) -or (-not $(Get-InstalledModule).Name.contains('posh-git')) ) {
  Install-Module 'posh-git' -Scope CurrentUser
}

# install Terminal-Icons module
if ( (-not $(Get-InstalledModule)) -or (-not $(Get-InstalledModule).Name.contains('Terminal-Icons')) ) {
  Install-Module 'Terminal-Icons' -Scope CurrentUser
}

# load fnm & generate fnm's completions file
$fnmCompletionsPs1Path = Join-Path $PSScriptRoot 'powershell' 'completions' '_fnm.completions.ps1'

if (-not $(Test-Path $fnmCompletionsPs1Path -PathType Leaf)) {
  $command = @'
    Set-ExecutionPolicy RemoteSigned -scope CurrentUser
    fnm env --use-on-cd | Out-String | Invoke-Expression
    fnm completions --shell powershell
'@

  powershell.exe -NoProfile -Command "$command > $fnmCompletionsPs1Path"
}
