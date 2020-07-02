echo 'installing tmux...'

if type tmux &> /dev/null; then
  echo 'tmux has been installed, skip installation'
  exit 0
fi

if type apt-get &> /dev/null; then
  sudo apt install -y tmux
fi

if type brew &> /dev/null; then
  brew install tmux
fi

if type pacman &> /dev/null; then
  yes | sudo pacman -S tmux
fi

echo 'tmux is ready!'
