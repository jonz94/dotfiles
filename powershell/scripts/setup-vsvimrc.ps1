# setup vsvimrc

$vsvimrcPath = "${HOME}\.vsvimrc"
$dotfilesVsvimrcPath = "${HOME}\dotfiles\vsvim\vsvimrc"

if (Test-Path $vsvimrcPath) {
  $time = $(Get-Date -Format "yyyy-MM-dd-HH-mm-ss")
  $backupVsvimrcPath = "$vsvimrcPath-backup-$time"

  Move-Item $vsvimrcPath -Destination $backupVsvimrcPath
  Write-Host "Backup original vsvimrc to $backupVsvimrcPath"
}

# when making symlink, admin permission is required
sudo New-Item $vsvimrcPath -ItemType SymbolicLink -Value $dotfilesVsvimrcPath

Write-Host 'Done! 🎉'
