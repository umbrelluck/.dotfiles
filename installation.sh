#! /bin/bash

confd="$XDG_CONFIG_HOME"
homed="$HOME"

mkdir -p "$confd/alacritty/a_themes"
stow -t "$confd/alacritty" alacritty 
git clone https://github.com/alacritty/alacritty-theme "$confd/alacritty/a_themes"

mkdir -p "$confd/nvim"
stow -t "$confd/nvim" nvim 

mkdir -p "$confd/paru"
stow -t "$confd/paru" paru 

mkdir -p "$confd/qtile"
stow -t "$confd/qtile" qtile 

mkdir -p "$confd/alacritty"
stow -t "$confd/ranger" ranger 

mkdir -p "$confd/X11"
stow -t "$confd/X11" X11 

mkdir -p "$confd/xplr"
stow -t "$confd/xplr" xplr 

stow -t "$homed" scripts 
stow -t "$homed" zsh 
zsh && . "$SCRSDIR/zsh_plugin&script_downloader.sh"
stow -t "$homed" powerlevel10k 
