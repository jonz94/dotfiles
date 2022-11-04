# rbenv

if (( $+commands[rbenv] )); then
  eval "$(rbenv init - zsh)"
elif [ -s "$HOME/.rbenv/bin/rbenv" ]; then
  eval "$(~/.rbenv/bin/rbenv init - zsh)"
fi
