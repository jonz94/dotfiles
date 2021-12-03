# setup neovim

$neovimUserDataDirectory = Join-Path $env:LOCALAPPDATA 'nvim'
$dotfilesNvimDirectory = "${HOME}\dotfiles\nvim"

# when making symlink, admin permission is required
sudo New-Item $neovimUserDataDirectory -ItemType SymbolicLink -Value $dotfilesNvimDirectory

Write-Host 'Done! 🎉'
