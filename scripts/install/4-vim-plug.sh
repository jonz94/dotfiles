echo 'Install vim-plug for neovim...'

PLUGIN_DIR="${HOME}/.local/share/nvim/site/autoload"
URL='https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if [ -f ${PLUGIN_DIR}/plug.vim ]; then
  echo 'vim-plug has been installed, skip installation.'
else
  curl -sfLo ${PLUGIN_DIR}/plug.vim --create-dirs ${URL}
fi

echo 'vim-plug is ready!'
