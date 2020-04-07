#!/bin/sh

dug() {
  echo ${BLUE}"[dotfiles]" updating...${NORMAL}
  git -C ${DOTS} fetch --all --prune
  git -C ${DOTS} pull

  echo ${BLUE}"[zplug]" clean up${NORMAL}
  zplug clean

  echo ${BLUE}"[zplug]" clear cache${NORMAL}
  zplug clear

  echo ${BLUE}"[zplug]" updating...${NORMAL}
  zplug update
  echo
}
