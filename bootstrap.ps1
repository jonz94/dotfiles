# setting up git
git config --global user.name "jonz94"
git config --global user.email "jody16888@gmail.com"

# Create local profile if it does not exist
if (-Not $(Test-Path "$HOME\dotfiles\local\local.ps1")) {
  New-Item "$HOME\dotfiles\local\local.ps1" -ItemType File -Force | Out-Null
}

# Create $PROFILE file if it does not exists
if (-Not $(Test-Path "$PROFILE")) {
  New-Item "$PROFILE" -ItemType File -Force | Out-Null
}

# Source our custom profiles
Add-Content "$PROFILE" -Encoding UTF8 -Value '. $HOME\dotfiles\powershell\jonz94.ps1'
Add-Content "$PROFILE" -Encoding UTF8 -Value '. $HOME\dotfiles\local\local.ps1'

Install-Module posh-git -Scope CurrentUser
Install-Module oh-my-posh -Scope CurrentUser
Install-Module PSFzf -Scope CurrentUser
Install-Module DockerCompletion -Scope CurrentUser
