﻿# utf-8 for printing
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# opt-out powershell telemetry
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_telemetry
$env:POWERSHELL_TELEMETRY_OPTOUT = 'yes'

# disable less history file
$env:LESSHISTFILE = '-'

# oh my posh
# https://github.com/JanDeDobbeleer/oh-my-posh
# enable posh-git module
$env:POSH_GIT_ENABLED = $true
# disable Az.Accounts module
$env:AZ_ENABLED = $false
if ( $(scoop which oh-my-posh) ) {
  Invoke-Expression (oh-my-posh --init --shell pwsh --config ~/dotfiles/powershell/jonz94.omp.json)
}

# terminal icons for powershell
# https://github.com/devblackops/Terminal-Icons
Import-Module 'Terminal-Icons'

# use Emacs mode, just like unix-y environment
Set-PSReadlineOption -EditMode Emacs

# no more beep
Set-PSReadlineOption -BellStyle None

# make shell history cleaner
Set-PSReadlineOption -HistoryNoDuplicate

# show predictive suggestions from command history
Set-PSReadLineOption -PredictionSource History

# any command with spaces or tabs at the beginning of the line is not added to the PSReadLine history
# credit: https://github.com/PowerShell/PowerShell/issues/10403#issuecomment-523833700
Set-PSReadLineOption -AddToHistoryHandler {
  param($line)
  $line -notmatch '^\s+'
}

# print out PSReadline history instead of using powershell's Get-History
Remove-Item Alias:\history -Force *> $null
function history {
  Get-Content (Get-PSReadLineOption).HistorySavePath
}

# edit PSReadLine history file via vscode
function edit-history {
  code (Get-PSReadLineOption).HistorySavePath
}

# ctrl + shift + v for paste
Set-PSReadlineKeyHandler -Key Ctrl+V -Function Paste

# load fnm
if ( $(scoop which fnm) ) {
  fnm env --use-on-cd | Out-String | Invoke-Expression
}

# load zoxide
if ( $(scoop which zoxide) ) {
  Invoke-Expression (& {
    $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
    (zoxide init --hook $hook powershell) -join "`n"
  })
}

# test if current powershell is running with administrator privileges
function Test-Administrator {
  $user = [Security.Principal.WindowsIdentity]::GetCurrent()
  (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

# clear
Set-Alias -Name c -Value Clear-Host

# poweroff
function poweroff { shutdown /s /t 0 }

# shutdown WSL
function wslshutdown { wsl.exe --shutdown }
function wslpoweroff { wsl.exe --shutdown }

# open current directory in vscode
function c. { code . }

# open current directory in vscode-insiders
function ci. { code-insiders . }
function ci { code-insiders }

# explorer aliases
function e. { explorer.exe . }
function e { explorer.exe $args }
function o. { explorer.exe . }
function open { explorer.exe $args }

# echo path in pretty format
function echopath { (echo $Env:PATH).split(';') }

# echo powershell's escape character, because I've always thought it is backslash...
function echo-powershell-escape-character {
  Write-Host "Powershell's escape character is backquote ``"
}

# open recycle bin directory in file explorer
function trash { Start-Process shell:RecycleBinFolder }

# cd to dotfiles
function dot { Set-Location $HOME\dotfiles }

# make a directory with `-p` flag (no error if existing, make parent directories as needed)
function mkdirp {
  if ($args.length -lt 1) {
    return
  }

  New-Item -ItemType Directory -ErrorAction SilentlyContinue $args[0]
}

# make a directory with `-p` flag and then cd into it
function take {
  if ($args.length -lt 1) {
    return
  }

  New-Item -ItemType Directory -ErrorAction SilentlyContinue $args[0]
  Set-Location $args[0]
}

# kill process
function pkill { taskkill.exe /IM $args }

# make aliases
function m { make.exe $args }

# docker aliases
function d { docker.exe $args }

function de { docker.exe exec --interactive --tty $args }

function dei { docker.exe exec --interactive $args }

function dex { docker.exe exec $args }

function di { docker.exe image $args }

function din { docker.exe inspect $args }

function dlg { docker.exe logs $args }

function dn { docker.exe network $args }

function dp { docker.exe pull $args }

function dpa { docker.exe ps -a }

function drm {
  foreach ($arg in $args) {
    docker.exe stop $arg
    docker.exe rm $arg
  }
}

function dst {
  Write-Host "`n【Container 容器執行狀態列表】"
  docker.exe container ls -a
  Write-Host "`n【Volume 儲存空間列表】"
  docker.exe volume ls
  Write-Host "`n【Network 網路列表】"
  docker.exe network ls
  Write-Host ""
}

function dv { docker.exe volume $args }

# docker compose aliases
function dc { docker-compose.exe $args }

# git aliases
function g { git $args }

function ga { git add $args }

function gaa { git add -A }

function gb { git branch $args }

function gba { git branch -a $args }

function gbd { git branch -d $args }

function gbD { git branch -D $args }

function gbD { git branch -D $args }

function gbv { git branch -v $args }

function gbvv { git branch -vv $args }

Remove-Item Alias:\gc -Force *> $null
function gc { git commit -v $args }

function gc! { git commit -v --amend $args }

function gca { git commit -v -a $args }

function gca! { git commit -v -a --amend $args }

Remove-Item Alias:\gcb -Force *> $null
function gcb { git checkout -b $args }

function gcl { git clone --recurse-submodules $args }

Remove-Item Alias:\gcm -Force *> $null
function gcm {
  if ($(git rev-parse --verify --quiet main)) {
    git checkout main
  } else {
    git checkout master
  }
}

function gcmsg { git commit -m $args }

function gco { git checkout $args }

function gcot { git checkout --track $args }

function gd { git diff $args }

function gdc { git diff --cached $args }

function gds { git diff --staged $args }

function gfa { git fetch --all --prune $args }

Remove-Item Alias:\gl -Force *> $null
function gl { git pull $args }

function glg { git log --stat $args }

function glgg { git log --graph $args }

function glo { git log --oneline --decorate $args }

function gloga { git log --oneline --decorate --graph --all $args }

function gls { git log --show-signature }

# show graph for git reflog command
# credit: https://gist.github.com/matthewmccullough/988077
function glggr {
  git log --graph --decorate $(git reflog --format=format:%h);
}

function glogr {
  git log --oneline --graph --decorate $(git reflog --format=format:%h);
}

Remove-Item Alias:\gp -Force *> $null
function gp { git push $args }

function gpD { git push --delete $args }

# Note: `Get-GitBranch` is a helper from posh-git module
function gpsup { git push -u origin $((Get-GitStatus).Branch) $args }

function gr { git remote $args }

function grb { git rebase $args }

function grbi { git rebase -i $args }

function grbm { git rebase master $args }

function grv { git remote -v $args }

function grh { git reset $args }

function grhh { git reset --hard $args }

function grsh { git reset --soft $args }

function gst { git status $args }

function gsta { git stash push $args }

function gstai { git stash push --include-untracked $args }

function gstc { git stash clear $args }

function gstl { git stash list $args }

function gstp { git stash pop $args }

function gsts { git stash show $args }

function gundo { git reset --soft HEAD~1 }

function gwip {
  git add -A;
  git rm $(git ls-files --deleted) 2> $null;
  git commit --no-verify --no-gpg-sign -m "🚧 WIP: work in progress...";
}

# fix `warning: ignoring broken ref refs/remotes/origin/HEAD` message
function git-fix-ignoring-broken-ref-warning {
  git remote set-head origin $((Get-GitStatus).Branch)
}

# scoop aliases
function i { scoop install $args }
function scl { scoop cleanup $args }
function scl* { scoop cleanup * }
function si { scoop info $args }

Remove-Item Alias:\sls -Force *> $null
function sls { scoop list }

function ss { scoop search $args }
function sst { scoop status }

function sup { scoop update $args }

function sug { scoop upgrade }
function ug { scoop upgrade }

# change terminal background color by using special ansi escape sequences
#
# example usage 1:
#     change-terminal-background-color -Color "#282c34"
#
# example usage 2:
#     change-terminal-background-color -Color "#121212"
#
# credit: https://github.com/alacritty/alacritty/issues/656
function change-terminal-background-color {
  param(
    [string]$Color
  )

  Write-Host "`e]11;${Color}`a" -NoNewline
}

function nvim-with-dynamic-terminal-background-color {
  change-terminal-background-color -Color "#282c34"
  nvim.exe $args
  change-terminal-background-color -Color "#121212"
}

# neovim aliases
function v { nvim-with-dynamic-terminal-background-color $args }
function vi { nvim-with-dynamic-terminal-background-color $args }
function vim { nvim-with-dynamic-terminal-background-color $args }
function nvim { nvim-with-dynamic-terminal-background-color $args }

# in case the need to use vim
function \vim { vim.exe $args }

# open neovim normally without changing terminal background color
function \nvim { nvim.exe $args }

# npm
function nci { npm ci }
function nid { npm install --save-dev $args }
function nig { npm install -g $args }
function nis { npm install --save $args }
function nls { npm ls --depth 0 }
function nlsg { npm ls --depth 0 -g }
function nlso { npm outdated }
function nr { npm run $args }
function nrm { npm uninstall $args }

# always typo br
function br { npm run $args }

# quickly install prettier related packages via npm
function nip { npm install --save-dev prettier prettier-plugin-packagejson prettier-plugin-organize-imports typescript }

# yarn
function ya { yarn add }
function yad { yarn add --dev }
function ylso { yarn outdated }
function yr { yarn run }
function yrm { yarn remove }

# equivalent of `npm ci`
function yci {
  rimraf node_modules
  yarn install --frozen-lockfile
}

# quickly install prettier related packages via yarn
function yap { yarn add --dev prettier prettier-plugin-packagejson prettier-plugin-organize-imports typescript }

# jabba

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

# capacitor
function coa { npx cap open android }

# composer
function cr { composer require $args }
function crd { composer require --dev $args }
function cso { composer show -o $args }
function cug { composer global update --with-all-dependencies $args }
function cup { composer update --with-all-dependencies $args }
function cw { composer why $args }

# completions
Get-ChildItem –Path "~/dotfiles/powershell/completions" -Recurse -Filter *.ps1 | Foreach-Object {
  . $_.FullName
}

# whatis
function whatis { ((Get-Command $args[0]).Definition).Trim() }

# setup visual studio command prompt environment variables for current powershell session
# via invoking `vcvarsall.bat` provided by visual studio c++ build tools
#
# example usage 1:
#     invoke-vcvarsall -Architecture "x64" -ShowLogs
#
# example usage 2:
#     invoke-vcvarsall -Architecture "x64_arm64" -VcvarsallDir "D:\Microsoft Visual Studio\2019\BuildTools\VC\Auxiliary\Build" -ShowLogs
#
# credit: https://stackoverflow.com/a/21652729/9979122
function invoke-vcvarsall {
  param(
    [parameter(Mandatory, HelpMessage="See https://docs.microsoft.com/en-us/cpp/build/building-on-the-command-line#vcvarsall-syntax for available architecture")]
    [ValidateSet("x86", "x86_amd64", "x86_x64", "x86_arm", "amd64", "x64", "amd64_x86", "x64_x86", "amd64_arm", "x64_arm", "amd64_arm64", "x64_arm64")]
    [string]$Architecture,
    [string]$VcvarsallDir = "${Env:ProgramFiles(x86)}\Microsoft Visual Studio\2019\BuildTools\VC\Auxiliary\Build",
    [switch]$ShowLogs
  )

  $vcvarsallPath = (Join-Path $VcvarsallDir "vcvarsall.bat")
  if (!(Test-Path $vcvarsallPath)) {
    Write-Host "[Error]: Invoke-VcVarsAll failed." -ForegroundColor Red
    Write-Host "${vcvarsallPath}: No such file." -ForegroundColor Red
    return
  }

  Push-Location $VcvarsallDir

  cmd.exe /c "vcvarsall.bat ${Architecture} & set" | foreach {
    if ($_ -match "(.*?)=(.*)") {
      Set-Item -Force -Path "ENV:\$($matches[1])" -Value "$($matches[2])"
    }
  }

  Pop-Location

  if ($ShowLogs) {
    Write-Host "Visual Studio Command Prompt variables set. (Architecture: ${Architecture})" -ForegroundColor Green
  }
}

# add backwards compatibility for older powershell
if ( $HOST.Version.Major -ge 7 ) {
  # only source this profile when powershell major version number is >= 7
  . $HOME\dotfiles\powershell\pwsh.ps1
} else {
  function gpoat {
    if ( $(git push origin --all) ) {
      git push origin --tags
    }
  }

  function sud { scoop update; scoop status }
  function ud { scoop update; scoop status }
}
