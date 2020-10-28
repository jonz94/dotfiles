# fast node version manager

if (( $+commands[fnm] )); then
  eval "$(fnm env)"
elif [ -s "$HOME/.fnm/fnm" ]; then
  export PATH="$HOME/.fnm:$PATH"
  eval "$(fnm env)"
fi
