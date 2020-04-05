#!/bin/sh

dug() {
  # update zsh plugins via zplug
  zplug update
  echo

  # update dotfiles
  echo -e ${BLUE}"[Updating]" dotfiles${NORMAL}
  git -C ${DOTS} fetch --all --prune
  git -C ${DOTS} pull
}
