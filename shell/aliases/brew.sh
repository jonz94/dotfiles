# brew aliases

if type brew &> /dev/null; then
  alias ud='brew update && brew cask outdated'
  alias ug='brew upgrade && brew cask upgrade'
fi
