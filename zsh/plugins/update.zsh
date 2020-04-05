#!/bin/sh

dug() {
  # update dotfiles
  echo -e ${BLUE}"[Updating]" dotfiles${NORMAL}
  git -C ${DOTS} fetch --all --prune
  git -C ${DOTS} pull

  # update zsh plugins via zplug
  zplug update
  echo
}
