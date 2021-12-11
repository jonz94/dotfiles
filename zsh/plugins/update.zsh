#!/bin/sh

dug() {
  printf "${BLUE}[dotfiles] updating...${NORMAL}\n"
  git -C ${DOTS} fetch --all --prune
  git -C ${DOTS} pull

  printf "${BLUE}[zim] updating...${NORMAL}\n"
  zsh ~/.zim/zimfw.zsh install
  zsh ~/.zim/zimfw.zsh update
  zsh ~/.zim/zimfw.zsh upgrade

  printf "${BLUE}[tpm] updating...${NORMAL}\n"
  ~/.tmux/plugins/tpm/bin/update_plugins all

  echo
}
