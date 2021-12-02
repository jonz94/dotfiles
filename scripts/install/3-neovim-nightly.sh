echo 'installing neovim nightly...'

if type nvim &> /dev/null; then
  echo 'neovim has been installed, skip installation.'
  exit 0
fi

bash $HOME/dotfiles/scripts/bin/install-neovim-nightly

echo 'neovim is ready!'
