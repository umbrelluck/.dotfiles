#!/usr/bin/bash

#TODO: add arguement support

DOTFILES=~/.dotfiles
cd $DOTFILES || echo 'no .dotfiles'

echo 'Starting copying dotfiles to their places'
stow *
zsh
$ZDOTDIR/scripts/plugin_downloader.sh
