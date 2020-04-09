echo 'installing neovim...'

if `hash nvim 2>/dev/null`; then
  echo 'neovim has been installed... skip installation.'
  exit 0
fi

if `hash apt-get 2>/dev/null`; then
  sudo apt install -y neovim
fi

if `hash brew 2>/dev/null`; then
  brew install neovim
fi

if `hash pacman 2> /dev/null`; then
  yes | sudo pacman -S neovim
fi

echo 'neovim is ready!'
