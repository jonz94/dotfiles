#!/bin/sh

dug() {
  echo ${BLUE}"[dotfiles]" updating...${NORMAL}
  git -C ${DOTS} fetch --all --prune
  git -C ${DOTS} pull

  echo ${BLUE}"[zim]" updating...${NORMAL}
  zimfw install
  zimfw update
  zimfw upgrade

  echo ${BLUE}"[tpm]" updating...${NORMAL}
  ~/.tmux/plugins/tpm/bin/update_plugins all

  echo
}
