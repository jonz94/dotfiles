# dotfiles location
export DOTS=${HOME}/dotfiles

# load custom shell environment variables
for file in ${DOTS}/shell/variables/*.sh; do
  source ${file}
done

# Italic Font Setting for tmux
export TERM=xterm-256color

# Set neovim as preferred editor
export EDITOR=nvim

# golang
if type go &> /dev/null; then
  export PATH="$(go env GOPATH)/bin:${PATH}"
fi

# add ~/.local/bin to $PATH
export PATH="${HOME}/.local/bin:${PATH}"

# Disable less history file
export LESSHISTFILE=-

# Android
if [ -d "${HOME}/Android/Sdk" ]; then
  export ANDROID_HOME="${HOME}/Android/Sdk"
  export ANDROID_SDK_ROOT="${ANDROID_HOME}"
fi

# bat
if type bat &> /dev/null; then
  export BAT_CONFIG_PATH=${DOTS}/shell/bat.conf
fi

# paru
if type paru &> /dev/null; then
  export PARU_CONF=${DOTS}/shell/paru.conf
fi

# gpg settings for macOS
if [ $(uname) = "Darwin" ]; then
  export GPG_TTY=$(tty)
fi

# gpg settings for WSL 2
if [ $(uname -r | grep -i microsoft) ]; then
  export GPG_TTY=$(tty)
fi

export LANG=en_US.UTF-8

# set grep highlight colors (green background, white text)
# See: https://askubuntu.com/questions/1042234/modifying-the-color-of-grep
export GREP_COLORS="mt=30;42"

# set zsh-users/zsh-history-substring-search highlight colors
# See: https://github.com/zsh-users/zsh-history-substring-search#configuration
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="bg=green,fg=black,bold"
