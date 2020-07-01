# First include shell environment
source ${HOME}/dotfiles/shell/environment.sh

# custom shell variables
for file in ${DOTS}/shell/variables/*.sh; do
  source ${file}
done

# custom plugins
for file in ${DOTS}/zsh/plugins/*.zsh; do
  source ${file}
done

# local
for file in ${DOTS}/local/*.zsh; do
  source ${file}
done

# custom shell aliases
for file in ${DOTS}/shell/aliases/*.sh; do
  source ${file}
done

# enable wildcard matching
unsetopt no_match
