# fast node version manager

if (( $+commands[fnm] )); then
  eval "$(fnm env)"
elif [ -s "$HOME/.local/share/fnm/fnm" ]; then
  export PATH="$HOME/.local/share/fnm:$PATH"
  eval "$(fnm env)"
fi
