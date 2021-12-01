# jabba related settings
# https://github.com/shyiko/jabba

# switch java version globally via jabba
function switch-java-version-globally {
  if (-not (Test-Administrator)) {
    Write-Host 'Administrator rights are required' -f darkred
    return
  }

  if (-not $(jabba current)) {
    Write-Host "jabba: Cannot find currently 'use'ed java version" -f darkred
    Write-Host "Please execute 'jabba use <java_version>' before switch java version globally" -f darkred
    return
  }

  $envRegKey = [Microsoft.Win32.Registry]::LocalMachine.OpenSubKey('SYSTEM\CurrentControlSet\Control\Session Manager\Environment', $true)
  $envPath = $envRegKey.GetValue('Path', $null, 'DoNotExpandEnvironmentNames').replace('%JAVA_HOME%\bin;', '')
  [Environment]::SetEnvironmentVariable('JAVA_HOME', "$(jabba which $(jabba current))", 'Machine')
  [Environment]::SetEnvironmentVariable('PATH', "%JAVA_HOME%\bin;$envPath", 'Machine')
}
