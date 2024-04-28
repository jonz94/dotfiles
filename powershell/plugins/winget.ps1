function clean-up-winget-cache {
  Remove-Item -Force -Recurse "$env:LOCALAPPDATA\Temp\WinGet" -ErrorAction SilentlyContinue
  Write-Host 'Done! 🎉'
}
