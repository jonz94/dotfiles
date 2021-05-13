# setting up git
git config --global user.name "jonz94"
git config --global user.email "jody16888@gmail.com"
git config --global pull.rebase false
git config --global init.defaultBranch main

# Create local profile if it does not exist
if (-Not $(Test-Path "$HOME\dotfiles\local\local.ps1" -PathType Leaf)) {
  New-Item "$HOME\dotfiles\local\local.ps1" -ItemType File -Force *> $null
}

# Create $PROFILE file if it does not exists
if (-Not $(Test-Path "$PROFILE" -PathType Leaf)) {
  New-Item "$PROFILE" -ItemType File -Force *> $null
}

# Source our custom profiles
Add-Content "$PROFILE" -Encoding UTF8 -Value '. $HOME\dotfiles\powershell\jonz94.ps1'
Add-Content "$PROFILE" -Encoding UTF8 -Value '. $HOME\dotfiles\local\local.ps1'

# Install oh-my-posh3
if (-Not $(scoop which oh-my-posh) ) {
  scoop install oh-my-posh3
}

# Install neovim
if (-Not $(scoop which nvim) ) {
  scoop install neovim
}

# Create neovim's init.vim if it does not exist
if (-Not $(Test-Path "$HOME\AppData\nvim\init.vim")) {
  New-Item "$HOME\AppData\nvim\init.vim" -ItemType File -Force *> $null
}

# Create neovim's ginit.vim if it does not exists
if (-Not $(Test-Path "$HOME\AppData\nvim\ginit.vim")) {
  New-Item "$HOME\AppData\nvim\ginit.vim" -ItemType File -Force *> $null
}

# Source neovim configuration files
Add-Content "$HOME\AppData\nvim\init.vim" -Encoding UTF8 -Value 'source $HOME/dotfiles/nvim/jonz94.vim'
Add-Content "$HOME\AppData\nvim\ginit.vim" -Encoding UTF8 -Value 'source $HOME/dotfiles/nvim/jonz94.gvim'

# Install vim-plug
if (-Not $(Test-Path "$HOME\AppData\Local\nvim\autoload\plug.vim" -PathType Leaf)) {
  md ~\AppData\Local\nvim\autoload
  $uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  (New-Object Net.WebClient).DownloadFile(
    $uri,
    $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
      "~\AppData\Local\nvim\autoload\plug.vim"
    )
  )
}

# Install vim plugins
nvim.exe -c PlugInstall -c qa

# Install fzf
if (-Not $(scoop which fzf) ) {
  scoop install fzf
}

# Install fnm
if (-Not $(scoop which fnm) ) {
  scoop install fnm
}

# Install powershell modules
Install-Module posh-git -Scope CurrentUser
Install-Module PSFzf -Scope CurrentUser

# Load fnm & generate fnm's completions file
fnm env --use-on-cd | Out-String | Invoke-Expression
fnm completions --shell powershell > $HOME\dotfiles\powershell\completions\fnm.completions.ps1
