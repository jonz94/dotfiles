#!/bin/bash

GIT_NAME=${GIT_NAME:-"jonz94"}
GIT_MAIL=${GIT_MAIL:-:"jody16888@gmail.com"}

install() {
  for INSTALL_SCRIPT in ~/dotfiles/scripts/install/*.sh; do
    bash ${INSTALL_SCRIPT}
  done
}

backup() {
  if [ -f ${1} ]; then
    mkdir -p `dirname ${1}`
    echo "Backup old ${1} to ${1}.backup."`date +"%Y-%m-%d,%H:%M:%S"`
    mv ${1} ${1}.backup.`date +"%Y-%m-%d,%H:%M:%S"`
  fi
}

setup_zsh() {
  echo 'Setting up zsh...'

  rm $HOME/.zshenv
  ln -s $HOME/dotfiles/zsh/zim/.zshenv $HOME/.zshenv

  backup $HOME/.zshrc
  echo "source $HOME/dotfiles/zsh/zim/.zshrc" > $HOME/.zshrc

  rm $HOME/.zlogin
  ln -s $HOME/dotfiles/zsh/zim/.zlogin $HOME/.zlogin

  rm $HOME/.zimrc
  ln -s $HOME/dotfiles/zsh/zim/.zimrc $HOME/.zimrc

  # setup local configurations for zsh
  mkdir -p ~/dotfiles/local
  touch ~/dotfiles/local/local.zsh
  touch ~/dotfiles/local/theme.zsh

  echo 'Installing zsh modules...'
  zsh -c "source ${HOME}/.zshrc && zimfw install"

  # disable Powerlevel10k configuration wizard
  zsh -c "echo 'POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true' >>! ~/.zshrc"

  echo 'zsh is ready!'
}

setup_neovim() {
  echo 'Setting up neovim...'
  mkdir -p ~/.config/nvim

  backup ~/.config/nvim/init.vim
  echo 'source $HOME/dotfiles/nvim/jonz94.vim' >> ~/.config/nvim/init.vim

  backup ~/.config/nvim/ginit.vim
  echo 'source $HOME/dotfiles/nvim/jonz94.gvim' >> ~/.config/nvim/ginit.vim

  echo 'Installing neovim plugins...'
  nvim -c PlugInstall -c qa

  echo 'neovim is ready!'
}

setup_git() {
  echo 'Setting up git...'

  git config --global user.name ${GIT_NAME}
  git config --global user.email ${GIT_MAIL}
  git config --global pull.rebase false
  git config --global core.editor nvim
  git config --global init.defaultBranch main

  echo 'git is ready!'
}

setup_tmux() {
  echo 'Setting up tmux...'

  backup ~/.tmux.conf
  echo 'source-file $HOME/dotfiles/tmux/jonz94.tmux.conf' >> ~/.tmux.conf

  # setup local configurations for tmux
  mkdir -p ~/dotfiles/local
  cat ~/dotfiles/tmux/theme.tmux.conf >> ~/dotfiles/local/theme.tmux.conf
  cat ~/dotfiles/tmux/themepack.tmux.conf >> ~/dotfiles/local/themepack.tmux.conf

  echo 'tmux is ready!'
}

install
setup_zsh
setup_neovim
setup_git
setup_tmux

echo '🎉 All Done!'
echo '🙌 Some changes might need re-login to take effects.'
