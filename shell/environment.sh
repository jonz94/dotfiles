# dotfiles location
export DOTS=${HOME}/dotfiles

# shell variables
export VAR_DIR=${DOTS}/shell/variables

# Italic Font Setting for tmux
export TERM=xterm-256color

# Preferred editor for local and remote sessions
if [ -n ${SSH_CONNECTION} ]; then
  export EDITOR=vim
else
  export EDITOR=nvim
fi

# add ~/.local/bin to $PATH
if [ -d ${HOME}/.local/bin ]; then
  export PATH="${HOME}/.local/bin:${PATH}"
fi

# bat
if `hash bat 2>/dev/null`; then
  export BAT_CONFIG_PATH=${DOTS}/shell/bat.conf
fi

export LANG=en_US.UTF-8
