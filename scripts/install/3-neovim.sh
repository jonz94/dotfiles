echo 'installing neovim...'

if type nvim &> /dev/null; then
  echo 'neovim has been installed... skip installation.'
  exit 0
fi

if type apt-get &> /dev/null; then
  sudo apt install -y neovim
fi

if type brew &> /dev/null; then
  brew install neovim
fi

if type pacman &> /dev/null; then
  yes | sudo pacman -S neovim
fi

echo 'neovim is ready!'
