#!/bin/sh

dug() {
  echo ${BLUE}"[dotfiles]" updating...${NORMAL}
  git -C ${DOTS} fetch --all --prune
  git -C ${DOTS} pull

  echo ${BLUE}"[zim]" updating...${NORMAL}
  zsh ~/.zim/zimfw.zsh install
  zsh ~/.zim/zimfw.zsh update
  zsh ~/.zim/zimfw.zsh upgrade

  echo ${BLUE}"[vim-plug]" updating...${NORMAL}
  nvim -c PlugUpdate -c qa

  echo ${BLUE}"[tpm]" updating...${NORMAL}
  ~/.tmux/plugins/tpm/bin/update_plugins all

  echo
}
