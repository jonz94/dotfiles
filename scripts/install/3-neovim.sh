echo 'installing neovim...'

if type nvim &> /dev/null; then
  echo 'neovim has been installed, skip installation.'
  exit 0
fi

if type pkg &> /dev/null; then
  pkg install -y neovim
elif type apt-get &> /dev/null; then
  sudo apt install -y neovim
elif type brew &> /dev/null; then
  brew install neovim
elif type apk &> /dev/null; then
  apk add neovim
elif type pacman &> /dev/null; then
  yes | sudo pacman -S neovim
fi

echo 'neovim is ready!'
