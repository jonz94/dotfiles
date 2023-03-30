# resolve a strange issue caused by misconfigured permissions of the user font install directory
# https://github.com/matthewjberger/scoop-nerd-fonts/issues/198#issuecomment-1488996737

$userFontInstallDir = "${env:LOCALAPPDATA}\Microsoft\Windows\Fonts"

$accessControlList = Get-Acl $userFontInstallDir

# ALL APPLICATION PACKAGES
$allApplicationPackagesAccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule([System.Security.Principal.SecurityIdentifier]::new("S-1-15-2-1"), "ReadAndExecute", "ContainerInherit,ObjectInherit", "None", "Allow")

# ALL RESTRICTED APPLICATION PACKAGES
$allRestrictedApplicationPackagesAccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule([System.Security.Principal.SecurityIdentifier]::new("S-1-15-2-2"), "ReadAndExecute", "ContainerInherit,ObjectInherit", "None", "Allow")

$accessControlList.SetAccessRule($allApplicationPackagesAccessRule)
$accessControlList.SetAccessRule($allRestrictedApplicationPackagesAccessRule)

Set-Acl -AclObject $accessControlList $userFontInstallDir
