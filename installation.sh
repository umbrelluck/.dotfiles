#! /bin/bash

confd="$XDG_CONFIG_HOME"
homed="$HOME"

mkdir -p "$confd/alacritty"
stow -t "$confd/alacritty" alacritty 

mkdir -p "$confd/nvim"
stow -t "$confd/nvim" nvim 

mkdir -p "$confd/paru"
stow -t "$confd/paru" paru 

stow -t "$homed" powerlevel10k 

mkdir -p "$confd/qtile"
stow -t "$confd/qtile" qtile 

mkdir -p "$confd/alacritty"
stow -t "$confd/ranger" ranger 

stow -t "$homed" scripts 

mkdir -p "$confd/X11"
stow -t "$confd/X11" X11 

mkdir -p "$confd/xplr"
stow -t "$confd/xplr" xplr 

stow -t "$homed" zsh 
