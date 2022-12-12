# neovim command aliases

if ! type nvim &> /dev/null; then
  return
fi

# dynamic chaning terminal's background color when entering/leaving neovim
# credit: https://medium.com/@joao.paulo.silvasouza/change-your-terminals-background-color-dynamically-using-escape-sequences-aba6e5ed2b29
script_path="$DOTS/scripts/bin/change-terminal-background-color"

if [ -f $script_path ]; then
  nvim-with-dynamic-terminal-background-color () {
    # preserve "$@" as an array
    # credit: https://unix.stackexchange.com/questions/472589/pass-to-command-preserving-quotes
    args=("$@")
    do_not_change_background="false"

    if [ $# -gt 0 ]; then
      # check for command line flag
      # credit: https://stackoverflow.com/a/2875513/9979122
      while test $# != 0
      do
        case "$1" in
        -h|--help|-v|--version|-hv|-vh)
          do_not_change_background="true" ;;
        esac
        shift
      done
    fi

    if [ "$do_not_change_background" = "true" ]; then
      nvim "${args[@]}"
    else
      bash $script_path "#282c34"
      nvim "${args[@]}"
      bash $script_path "#121212"
    fi
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

# aliases for quickly editing shell history file
if [ -f "${HOME}/.zhistory" ]; then
  alias vh="nvim -c 'normal! G' ${HOME}/.zhistory"
elif [ -f "${HOME}/.zsh_history" ]; then
  alias vh="nvim -c 'normal! G' ${HOME}/.zsh_history"
else
  echo "${RED}shell history file not found...${NORMAL}"
  exit 1
fi

# aliases with sudo
alias sv.='sudo nvim .'
alias sv,='sudo nvim .'
alias sv='sudo nvim'
