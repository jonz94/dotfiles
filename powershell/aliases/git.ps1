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

function gl1 { git log -n 1 }

function glg { git log --stat $args }

function glgg { git log --graph $args }

function glgga { git log --graph --decorate --all $args }

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

function gpt { git push --follow-tags }

# Note: `Get-GitBranch` is a helper from posh-git module
function gpsup { git push -u origin $((Get-GitStatus).Branch) $args }

function gr { git remote $args }

function grao { git remote add origin $args }

function grau { git remote add upstream $args }

function grb { git rebase $args }

function grbi { git rebase -i $args }

function grbm {
  if ($(git rev-parse --verify --quiet main)) {
    git rebase main $args
  } else {
    git rebase master $args
  }
}

function grmv { git remote rename $args }

function grmvou { git remote rename origin upstream }

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

function git-fix-filename-ignorecase {
  Write-Host "apply the fix for filename ignore case issue by: ``git config core.ignorecase false``"
  git config core.ignorecase false
}

function git-fix-filename-ignorecase-revert {
  Write-Host "revert the fix for filename ignore case issue by: ``git config core.ignorecase true``"
  git config core.ignorecase true
}

# fix `warning: ignoring broken ref refs/remotes/origin/HEAD` message
function git-fix-ignoring-broken-ref-warning {
  git remote set-head origin $((Get-GitStatus).Branch)
}

# fix `Filename too long` issue on Windows
# credits: https://stackoverflow.com/questions/22575662/filename-too-long-in-git-for-windows
function git-fix-filename-too-long {
  git config --global core.longpaths true
}
