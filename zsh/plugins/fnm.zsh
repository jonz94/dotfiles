# fast node version manager
# https://github.com/Schniz/fnm

export FNM_DIR="$HOME/.local/share/fnm"

if (( $+commands[fnm] )); then
  eval "$(fnm env --use-on-cd --version-file-strategy=recursive)"
elif [ -s "$FNM_DIR/fnm" ]; then
  export PATH="$FNM_DIR:$PATH"
  eval "$(fnm env --use-on-cd --version-file-strategy=recursive)"
fi
