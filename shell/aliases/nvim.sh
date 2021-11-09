# neovim command aliases

if ! type nvim &> /dev/null; then
  return
fi

# dynamic chaning terminal's background color when entering/leaving neovim
# credits: https://medium.com/@joao.paulo.silvasouza/change-your-terminals-background-color-dynamically-using-escape-sequences-aba6e5ed2b29
script_path="$DOTS/scripts/bin/change-terminal-background"

if [ -f $script_path ]; then
  nvim-with-dynamic-terminal-background-color () {
    bash $script_path "#282c34"
    nvim "$@"
    bash $script_path "#121212"
  }

  alias v='nvim-with-dynamic-terminal-background-color'
  alias vi='nvim-with-dynamic-terminal-background-color'
  alias vim='nvim-with-dynamic-terminal-background-color'
  alias nvim='nvim-with-dynamic-terminal-background-color'
else
  alias v='nvim'
  alias vi='nvim'
  alias vim='nvim'
fi

# aliases for quickly editing local dotfiles
alias vd="nvim -c 'cd ${DOTS}' ${DOTS}"
alias vz="nvim -c 'cd ${DOTS}' ${DOTS}/local/local.zsh"
alias vv="nvim -c 'cd ${DOTS}' ${DOTS}/nvim/jonz94.vim"

# with sudo
alias sv.='sudo nvim .'
alias sv,='sudo nvim .'
alias sv='sudo nvim'
