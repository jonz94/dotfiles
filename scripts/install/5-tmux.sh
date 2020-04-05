echo 'installing tmux...'

if `hash tmux 2>/dev/null`; then
  echo 'tmux has been installed, skip installation'
  exit 0
fi

if `hash apt-get 2> /dev/null`; then
  sudo apt install -y tmux
fi

if `hash brew 2> /dev/null`; then
  brew install tmux
fi

echo 'tmux is ready!'
