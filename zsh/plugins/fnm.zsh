# fast node version manager

if (( $+comands[fnm] )); then
  eval "$(fnm env --multi)"
elif [ -s "$HOME/.fnm/fnm" ]; then
  export PATH="$HOME/.fnm:$PATH"
  eval "$(fnm env --multi)"
fi
