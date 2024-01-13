#! /bin/bash

confd="$XDG_CONFIG_HOME"

mkdir -p "$confd/alacritty/a_themes" 
stow -t "$confd/alacritty" alacritty 
if [ ! -d "$confd/alacritty/a_themes" ]; then 
    git clone https://github.com/alacritty/alacritty-theme "$confd/alacritty/a_themes"
else
    echo "Updating existing alacritty themes"
    git --git-dir="$HOME/.dotfiles/.git/" --work-tree="$HOME/.dotfiles/" pull
fi

mkdir -p "$confd/nvim"
stow -t "$confd/nvim" nvim 

mkdir -p "$confd/paru"
stow -t "$confd/paru" paru 

mkdir -p "$confd/qtile"
stow -t "$confd/qtile" qtile 

mkdir -p "$confd/ranger"
stow -t "$confd/ranger" ranger 

mkdir -p "$confd/X11"
stow -t "$confd/X11" X11 

mkdir -p "$confd/xplr"
stow -t "$confd/xplr" xplr 

mkdir -p "$confd/hypr"
stow -t "$confd/hypr" hyprland

if [ ! -d "/etc/lemurs/wms" ] || [ ! -d "/etc/lemurs/wayland" ]; then
    echo "Lemurs setup needs password to write files"
    sudo ln -s "$HOME/.dotfiles/lemurs/wms" "/etc/lemurs/wms"
    sudo ln -s "$HOME/.dotfiles/lemurs/wayland" "/etc/lemurs/wayland"
fi

stow -t "$HOME" tmux
if [ ! -d "$HOME/.tmux/plugins/tpm/.git" ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

stow -t "$HOME" scripts 
stow -t "$HOME" powerlevel10k 
stow -t "$HOME" zsh 
zsh && . "$SCRSDIR/zsh_plugin&script_downloader.sh"

