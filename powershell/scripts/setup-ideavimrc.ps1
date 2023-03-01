# setup ideavimrc

$ideavimrcPath = "${HOME}\.ideavimrc"
$dotfilesIdeavimrcPath = "${HOME}\dotfiles\ideavim\ideavimrc"

if (Test-Path $ideavimrcPath) {
  $time = $(Get-Date -Format "yyyy-MM-dd-HH-mm-ss")
  $backupIdeavimrcPath = "$ideavimrcPath-backup-$time"

  Move-Item $ideavimrcPath -Destination $backupIdeavimrcPath
  Write-Host "Backup original ideavimrc to $backupIdeavimrcPath"
}

# when making symlink, admin permission is required
sudo New-Item $ideavimrcPath -ItemType SymbolicLink -Value $dotfilesIdeavimrcPath

Write-Host 'Done! 🎉'
