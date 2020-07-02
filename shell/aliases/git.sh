# Git command aliases

if type git &> /dev/null; then
  alias gbv='git branch -v'
  alias gbvv='git branch -vv'
  alias gcot='git checkout --track'
  alias gdc='git diff --cached'
  alias gstaa='git stash push --include-untracked'
  alias grsh='git reset --soft'
  alias gstai='git stash push --include-untracked'
  alias gstau='git stash push --include-untracked'
  alias gsw-='git switch -'
  alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "🚧 WIP: work in progress..."'

  # show graph for git reflog command
  # Credit: https://gist.github.com/matthewmccullough/988077
  alias glggr='git log --graph --decorate `git reflog --format=format:%h`'
  alias glogr='git log --oneline --graph --decorate `git reflog --format=format:%h`'
fi
