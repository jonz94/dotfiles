# setup visual studio command prompt environment variables for current powershell session
# via invoking `vcvarsall.bat` provided by visual studio c++ build tools
#
# example usage 1:
#     invoke-vcvarsall -Architecture "x64" -ShowLogs
#
# example usage 2:
#     invoke-vcvarsall -VcvarsallDir "${env:ProgramFiles(x86)}\Microsoft Visual Studio\2019\BuildTools\VC\Auxiliary\Build"
#
# example usage 3:
#     invoke-vcvarsall -Architecture "x64_arm64" -VcvarsallDir "D:\Microsoft Visual Studio\2019\BuildTools\VC\Auxiliary\Build" -ShowLogs
#
# credit: https://stackoverflow.com/a/21652729/9979122
function invoke-vcvarsall {
  param(
    [parameter(Mandatory, HelpMessage = 'See https://docs.microsoft.com/en-us/cpp/build/building-on-the-command-line#vcvarsall-syntax for available architecture')]
    [ValidateSet('x86', 'x86_amd64', 'x86_x64', 'x86_arm', 'x86_arm64', 'amd64', 'x64', 'amd64_x86', 'x64_x86', 'amd64_arm', 'x64_arm', 'amd64_arm64', 'x64_arm64')]
    [string] $Architecture,
    [string] $VcvarsallDir = "${env:ProgramFiles}\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build",
    [switch] $ShowLogs
  )

  $vcvarsallPath = (Join-Path $VcvarsallDir 'vcvarsall.bat')
  if (!(Test-Path $vcvarsallPath)) {
    Write-Host '[Error]: Invoke-VcVarsAll failed.' -ForegroundColor Red
    Write-Host "${vcvarsallPath}: No such file." -ForegroundColor Red
    return
  }

  Push-Location $VcvarsallDir

  cmd.exe /c "vcvarsall.bat ${Architecture} & set" | ForEach-Object {
    if ($_ -match '(.*?)=(.*)') {
      Set-Item -Force -Path "ENV:\$($matches[1])" -Value "$($matches[2])"
    }
  }

  Pop-Location

  if ($ShowLogs) {
    Write-Host "Visual Studio Command Prompt variables set. (Architecture: ${Architecture})" -ForegroundColor Green
  }
}
