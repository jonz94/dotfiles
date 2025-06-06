#!/bin/bash

GIT_NAME=${GIT_NAME:-"jonz94"}
GIT_MAIL=${GIT_MAIL:-"jody16888@gmail.com"}

install() {
  for INSTALL_SCRIPT in ~/dotfiles/scripts/install/*.sh; do
    bash ${INSTALL_SCRIPT}
  done
}

backup() {
  if [ -f ${1} ]; then
    mkdir -p $(dirname ${1})

    TIMESTAMP=$(date +"%Y-%m-%d,%H:%M:%S")

    echo "Backup old ${1} to ${1}.backup.${TIMESTAMP}"
    mv ${1} ${1}.backup.${TIMESTAMP}
  fi
}

setup_zsh() {
  echo 'Setting up zsh...'

  backup $HOME/.zshenv
  backup $HOME/.zlogin
  backup $HOME/.zimrc

  ln -s $HOME/dotfiles/zsh/zim/zshenv.zsh $HOME/.zshenv
  ln -s $HOME/dotfiles/zsh/zim/zlogin.zsh $HOME/.zlogin
  ln -s $HOME/dotfiles/zsh/zim/zimrc.zsh $HOME/.zimrc
  echo "source $HOME/dotfiles/zsh/zim/zshrc.zsh" > $HOME/.zshrc

  # setup local configurations for zsh
  mkdir -p ~/dotfiles/local
  touch ~/dotfiles/local/local.zsh
  touch ~/dotfiles/local/theme.zsh

  echo 'Installing zsh modules...'
  zsh ~/.zim/zimfw.zsh install

  # disable Powerlevel10k configuration wizard
  zsh -c "echo 'POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true' >>! ~/.zshrc"

  echo 'zsh is ready!'
}

setup_neovim() {
  echo 'Setting up neovim...'
  NVIM_CONFIG_DIR="$HOME/.config/nvim"

  # backup
  if [ -e $NVIM_CONFIG_DIR ]; then
    TIMESTAMP=$(date +"%Y-%m-%d,%H:%M:%S")

    echo "Backup ${NVIM_CONFIG_DIR} to ${NVIM_CONFIG_DIR}.backup.${TIMESTAMP}"
    mv ${NVIM_CONFIG_DIR} ${NVIM_CONFIG_DIR}.backup.${TIMESTAMP}
  fi

  mkdir -p $(dirname ${NVIM_CONFIG_DIR})
  ln -s $HOME/dotfiles/nvim $NVIM_CONFIG_DIR

  echo 'neovim is ready!'
}

setup_git() {
  echo 'Setting up git...'

  git config --global user.name ${GIT_NAME}
  git config --global user.email ${GIT_MAIL}
  git config --global pull.rebase true
  git config --global core.editor nvim
  git config --global core.ignoreCase false
  git config --global init.defaultBranch main

  echo 'git is ready!'
}

setup_tmux() {
  echo 'Setting up tmux...'

  backup ~/.tmux.conf
  echo 'source-file $HOME/dotfiles/tmux/jonz94.tmux.conf' >> ~/.tmux.conf

  # setup local configurations for tmux
  mkdir -p ~/dotfiles/local

  backup ~/dotfiles/local/theme.tmux.conf
  cp ~/dotfiles/tmux/theme.tmux.conf ~/dotfiles/local/theme.tmux.conf

  backup ~/dotfiles/local/themepack.tmux.conf
  cp ~/dotfiles/tmux/themepack.tmux.conf ~/dotfiles/local/themepack.tmux.conf

  echo 'Installing tmux plugins...'
  ~/.tmux/plugins/tpm/bin/install_plugins

  echo 'tmux is ready!'
}

setup_fnm_completions_for_linux() {
  if [ $(uname) = "Linux" ]; then
    export PATH="$HOME/.local/share/fnm:$PATH"
    eval "$(fnm env)"

    rm -f ~/dotfiles/zsh/completions/_fnm
    fnm completions --shell zsh > ~/dotfiles/zsh/completions/_fnm
  fi
}

install
setup_zsh
setup_neovim
setup_git
setup_tmux
setup_fnm_completions_for_linux

echo '🎉 All Done!'
echo '🙌 Some changes might need re-login to take effects.'
