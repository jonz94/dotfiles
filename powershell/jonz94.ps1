# UTF-8 for printing
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Opt-out powershell telemetry
$env:POWERSHELL_TELEMETRY_OPTOUT = true

# Disable less history file
$env:LESSHISTFILE = '-'

# Oh My Powershell
# https://github.com/JanDeDobbeleer/oh-my-posh
# enable posh-git module
$env:POSH_GIT_ENABLED = $true
if ( $(scoop which oh-my-posh) ) {
  Invoke-Expression (oh-my-posh --init --shell pwsh --config ~/dotfiles/powershell/jonz94.omp.json)
}

# Terminal Icons for Powershell
# https://github.com/devblackops/Terminal-Icons
Import-Module 'Terminal-Icons'

# Use Emacs mode, just like unix-y environment
Set-PSReadlineOption -EditMode Emacs

# No More Beep
Set-PSReadlineOption -BellStyle None

# Make shell history cleaner
Set-PSReadlineOption -HistoryNoDuplicate

# Show predictive suggestions from command history
Set-PSReadLineOption -PredictionSource History

# Any command with spaces or tabs at the beginning of the line is not added to the PSReadLine history
# Credit: https://github.com/PowerShell/PowerShell/issues/10403#issuecomment-523833700
Set-PSReadLineOption -AddToHistoryHandler {
  param($line)
  $line -notmatch '^\s+'
}

# Print out PSReadline history instead of using powershell's Get-History
Remove-Item Alias:\history -Force *> $null
function history {
  Get-Content (Get-PSReadLineOption).HistorySavePath
}

# Edit PSReadLine history file via vscode
function edit-history {
  code (Get-PSReadLineOption).HistorySavePath
}

# Ctrl + Shift + v for paste
Set-PSReadlineKeyHandler -Key Ctrl+V -Function Paste

# Load fnm
if ( $(scoop which fnm) ) {
  fnm env --use-on-cd | Out-String | Invoke-Expression
}

# Load zoxide
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

# Open current directory in vscode
function c. { code . }

# Open current directory in vscode-insiders
function ci. { code-insiders . }
function ci { code-insiders }

# explorer aliases
function e. { explorer.exe . }
function e { explorer.exe $args }
function o. { explorer.exe . }
function open { explorer.exe $args }

# echo path in pretty format
function echopath { (echo $Env:PATH).split(';') }

# Open recycle bin directory in file explorer
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
# Credit: https://gist.github.com/matthewmccullough/988077
function glggr {
  git log --graph --decorate $(git reflog --format=format:%h);
}

function glogr {
  git log --oneline --graph --decorate $(git reflog --format=format:%h);
}

Remove-Item Alias:\gp -Force *> $null
function gp { git push $args }

function gpD { git push --delete $args }

# Get-GitBranch is a helper from posh-git module
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

function sup* { scoop update * }
function ug { scoop update * }

function which { scoop which $args }

# neovim aliases
function v { nvim $args }
function vi { nvim $args }
function vim { nvim $args }
function \vim { vim.exe $args }
function v. {
  if (Test-Path .\Session.vim -PathType Leaf) {
    nvim -S Session.vim
  } else {
    nvim .
  }
}

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
