# setup environment first before doing anything else
source ${HOME}/dotfiles/shell/environment.sh

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
