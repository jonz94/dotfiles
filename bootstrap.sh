#!/bin/bash

GIT_NAME="jonz94"
GIT_MAIL="jody16888@gmail.com"

install() {
  for INSTALL_SCRIPT in ~/dotfiles/scripts/install/*.sh; do
    bash ${INSTALL_SCRIPT}
  done
}

backup() {
  if [ -f ${1} ]; then
    mkdir -p `dirname ${1}`
    echo "backup old ${1} to ${1}.backup."`date +"%Y-%m-%d,%H:%M:%S"`
    mv ${1} ${1}.backup.`date +"%Y-%m-%d,%H:%M:%S"`
  fi
}

setup_zsh() {
  echo 'setting up zsh...'

  rm $HOME/.zshenv
  ln -s $HOME/dotfiles/zsh/zim/.zshenv $HOME/.zshenv

  rm $HOME/.zshrc
  ln -s $HOME/dotfiles/zsh/zim/.zshrc $HOME/.zshrc

  rm $HOME/.zlogin
  ln -s $HOME/dotfiles/zsh/zim/.zlogin $HOME/.zlogin

  rm $HOME/.zimrc
  ln -s $HOME/dotfiles/zsh/zim/.zimrc $HOME/.zimrc

  echo 'zsh is ready!'
}

setup_neovim() {
  echo 'setting up neovim...'
  mkdir -p ~/.config/nvim

  backup ~/.config/nvim/init.vim
  echo 'source $HOME/dotfiles/nvim/jonz94.vim' >> ~/.config/nvim/init.vim

  backup ~/.config/nvim/ginit.vim
  echo 'source $HOME/dotfiles/nvim/jonz94.gvim' >> ~/.config/nvim/ginit.vim

  echo 'installing neovim plugins...'
  nvim -c PlugInstall -c qa

  echo 'neovim is ready!'
}

setup_git() {
  echo 'setting up git...'

  git config --global user.name ${GIT_NAME}
  git config --global user.email ${GIT_MAIL}
  git config --global pull.rebase false
  git config --global core.editor nvim

  echo 'git is ready!'
}

setup_local() {
  mkdir -p ~/dotfiles/local
  touch ~/dotfiles/local/local.zsh
  touch ~/dotfiles/local/theme.tmux.conf
  touch ~/dotfiles/local/theme.zsh
  touch ~/dotfiles/local/themepack.tmux.conf
}

install
setup_zsh
setup_neovim
setup_git
setup_local

echo '🎉 All Done!'
echo '🙌 Some changes might need re-login to take effects.'
