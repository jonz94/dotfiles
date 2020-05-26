# Git command aliases

if `hash git 2>/dev/null`; then
  alias gdc='git diff --cached'
  alias gbv='git branch -v'
  alias gbvv='git branch -vv'
  alias gcot='git checkout --track'
  alias gstaa='git stash push --include-untracked'
  alias gstai='git stash push --include-untracked'
  alias gstau='git stash push --include-untracked'
  alias gsw-='git switch -'
  alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "🚧 WIP: work in progress..."'
fi
