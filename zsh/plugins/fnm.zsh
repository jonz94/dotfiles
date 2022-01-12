# fast node version manager

export FNM_DIR="$HOME/.local/share/fnm"

if (( $+commands[fnm] )); then
  eval "$(fnm env --use-on-cd)"
elif [ -s "$FNM_DIR/fnm" ]; then
  export PATH="$FNM_DIR:$PATH"
  eval "$(fnm env --use-on-cd)"
fi
