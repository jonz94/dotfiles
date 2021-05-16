echo 'installing tmux...'

if type tmux &> /dev/null; then
  echo 'tmux has been installed, skip installation'
  exit 0
fi

if type pkg &> /dev/null; then
  pkg install -y tmux
elif type apt-get &> /dev/null; then
  sudo apt install -y tmux
elif type brew &> /dev/null; then
  brew install tmux
elif type pacman &> /dev/null; then
  yes | sudo pacman -S tmux
fi

echo 'tmux is ready!'
