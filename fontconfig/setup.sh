#!/bin/sh
# setup fontconfig

FONTCONFIG_DIR=$HOME/.config/fontconfig

mkdir -p $FONTCONFIG_DIR
cp $HOME/dotfiles/fontconfig/fonts.conf $FONTCONFIG_DIR

fc-cache -r
