# setup environment first before doing anything else
source ${HOME}/dotfiles/shell/environment.sh

# shell completions
# NOTE: the `(N)` parts is to set the `NULL_GLOB` option for the current pattern
# details: https://unix.stackexchange.com/a/504718/378105
# details: https://zsh.sourceforge.io/Doc/Release/Expansion.html#Glob-Qualifiers
for file in ${DOTS}/zsh/completions/_*(N); do
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
