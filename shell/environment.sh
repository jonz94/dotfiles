# dotfiles location
export DOTS=${HOME}/dotfiles

# shell variables
export VAR_DIR=${DOTS}/shell/variables

# Italic Font Setting for tmux
export TERM=xterm-256color

# Set neovim as preferred editor
export EDITOR=nvim

# add ~/.local/bin to $PATH
export PATH="${HOME}/.local/bin:${PATH}"

# Disable less history file
export LESSHISTFILE=-

# bat
if type bat &> /dev/null; then
  export BAT_CONFIG_PATH=${DOTS}/shell/bat.conf
fi

# paru
if type paru &> /dev/null; then
  export PARU_CONF=${DOTS}/shell/paru.conf
fi

# gpg settings for macOS
if [ `uname` = "Darwin" ]; then
  export GPG_TTY=$(tty)
fi

# gpg settings for WSL 2
if [ `uname -r | grep -i microsoft` ]; then
  export GPG_TTY=$(tty)
fi

export LANG=en_US.UTF-8
