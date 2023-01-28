# git command aliases

if type git &> /dev/null; then
  alias gbv='git branch -v'
  alias gbvv='git branch -vv'
  alias gcl1='git clone --recurse-submodules --depth 1'
  alias gcot='git checkout --track'
  alias gdc='git diff --cached'
  alias ginit='git init && git add -A && git commit -m "initial commit"'
  alias gl1='git log -n 1'
  alias gls='git log --show-signature'
  alias gpD='git push --delete'
  alias gpt='git push --follow-tags'
  alias grao='git remote add origin'
  alias grau='git remote add upstream'
  alias grmvou='git remote rename origin upstream'
  alias grsh='git reset --soft'
  alias gstaa='git stash push --include-untracked'
  alias gstai='git stash push --include-untracked'
  alias gstau='git stash push --include-untracked'
  alias gsw-='git switch -'
  alias gundo='git reset --soft HEAD~1'
  alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "🚧 WIP: work in progress..."'

  # show graph for git reflog command
  # credit: https://gist.github.com/matthewmccullough/988077
  alias glggr='git log --graph --decorate $(git reflog --format=format:%h)'
  alias glogr='git log --oneline --graph --decorate $(git reflog --format=format:%h)'

  # fix `warning: ignoring broken ref refs/remotes/origin/HEAD` issue
  alias git-fix-ignoring-broken-ref-warning='git remote set-head origin $(git_current_branch)'
fi
