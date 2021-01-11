# UTF-8 for printing
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Fix git log output encoding issues
# Credit: https://stackoverflow.com/questions/41139067/git-log-output-encoding-issues-on-windows-10-command-prompt
$Env:LESSCHARSET = 'utf-8'
$Env:LC_ALL = 'C.UTF-8'

if ( Test-Administrator ) { Set-Location $HOME }

# Powershell Module for Git prompt
# https://github.com/dahlbyk/posh-git
Import-Module posh-git

# Oh My Powershell
# https://github.com/JanDeDobbeleer/oh-my-posh
Import-Module oh-my-posh
Set-Theme Paradox

# Use Emacs mode, just like unix-y environment
Set-PSReadlineOption -EditMode Emacs

# No More Beep
Set-PSReadlineOption -BellStyle None

# Make shell history cleaner
Set-PSReadlineOption -HistoryNoDuplicate

# Ctrl + Shift + v for paste
Set-PSReadlineKeyHandler -Key Ctrl+V -Function Paste

# Powershell Module for fzf
Remove-PSReadlineKeyHandler 'Ctrl+t'
Remove-PSReadlineKeyHandler 'Ctrl+r'
Import-Module PSFzf

# tab completion for docker commands
Import-Module DockerCompletion

# A cd that learns
Import-Module ZLocation

# clear
Set-Alias -Name c -Value Clear-Host

# poweroff
function poweroff { shutdown /s /t 0 }

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

# Open recycle bin directory in file explorer
function trash { Start-Process shell:RecycleBinFolder }

# cd to dotfiles
function dot { Set-Location $HOME\dotfiles }

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

# docker machine aliases
function dm { docker-machine.exe $args }

function dcon { docker-machine.exe env | Invoke-Expression }

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
function gcm { git checkout master $args }

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

# Get-GitBranch is a helper from posh-git module
function gpsup { git push -u origin $(Get-GitBranch) }

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

function gwip {
  git add -A;
  git rm $(git ls-files --deleted) 2> $null;
  git commit --no-verify --no-gpg-sign -m "🚧 WIP: work in progress...";
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

function which { scoop which $args }

# neovim aliases
function v { nvim-qt $args }

function vi { nvim-qt $args }

function vim { nvim-qt $args }

function nvim { nvim-qt $args }

function v. { nvim-qt . }

# npm
function nid { npm install --save-dev $args }

function nig { npm install -g $args }

function nis { npm install --save $args }

function nls { npm ls --depth 0 }

function nlsg { npm ls --depth 0 -g }

function nlso { npm outdated }

function nr { npm run $args }

# always typo br
function br { npm run $args }

function nrm { npm uninstall $args }

# capacitor
function coa { npx cap open android }

# composer
function cr { composer require $args }
function crd { composer require --dev $args }
function cso { composer show -o $args }
function cug { composer global update --with-all-dependencies $args }
function cup { composer update --with-all-dependencies $args }
function cw { composer why $args }

# whatis
function whatis { ((Get-Command $args[0]).Definition).Trim() }
