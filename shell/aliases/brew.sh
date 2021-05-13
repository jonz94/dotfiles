# brew aliases

if type brew &> /dev/null; then
  alias ud='brew update && brew outdated'
  alias ug='brew upgrade'
  alias bcl='brew cleanup'
fi
