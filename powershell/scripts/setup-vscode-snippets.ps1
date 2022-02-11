# setup vscode snippets

$vscodeSnippetsDirectory = Join-Path $env:APPDATA 'Code\User\snippets'
$dotfilesVscodeSnippetsDirectory = "${HOME}\dotfiles\vscode\snippets"

Write-Host $vscodeSnippetsDirectory

if (Test-Path $vscodeSnippetsDirectory -PathType Container) {
  $time = $(Get-Date -Format "yyyy-MM-dd-HH-mm-ss")
  $backupSinnetsDirectory = "$vscodeSnippetsDirectory-backup-$time"

  Move-Item $vscodeSnippetsDirectory -Destination $backupSinnetsDirectory
  Write-Host "Backup original snippets to $backupSinnetsDirectory"
}

# when making symlink, admin permission is required
sudo New-Item $vscodeSnippetsDirectory -ItemType SymbolicLink -Value $dotfilesVscodeSnippetsDirectory

Write-Host 'Done! 🎉'
