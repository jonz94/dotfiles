# download the latest powershell installer

$release = Invoke-RestMethod -Uri "https://api.github.com/repos/PowerShell/PowerShell/releases/latest"
$version = $release.tag_name -replace '^v', ''
$downloadFilename = "PowerShell-$version-win-x64.msi"
$downloadUrl = "https://github.com/PowerShell/PowerShell/releases/download/$($release.tag_name)/$downloadFilename"

$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders"
$downloadsGuid = "{374DE290-123F-4565-9164-39C4925E467B}"

$shellPath = Get-ItemPropertyValue -Path $registryPath -Name $downloadsGuid -ErrorAction Stop

# expand any environment variables in the path (e.g., %USERPROFILE%)
$downloadsPath = [System.Environment]::ExpandEnvironmentVariables($shellPath)

$outputFile = Join-Path -Path $downloadsPath -ChildPath $downloadFilename

Invoke-WebRequest -Uri $downloadUrl -OutFile $outputFile

Write-Host "Downloaded PowerShell $version to $outputFile 🎉"
