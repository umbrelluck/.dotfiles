#! /usr/bin/zsh

if [[ ! command -v <the_command> &> /dev/null]];  then
    cwd=$(pwd)

    mkdir -p ~/Git
    git clone https://aur.archlinux.org/paru.git ~/Git/
    cd ~/Git/paru
    makepkg -si
    
    cd "$cwd"

    paru --gendb
fi

paru -S \
    alacritty \
    bat \
    bluetuith-bin \
    brightnessctl \
    delta \
    duf \
    dunst \
    gdu \
    neovim \
    pipewire \
    pipewire-alsa \
    pipewire-audio \
    pipewire-jack \
    pipewire-pulse \
    ranger \
    stow \
    tmux \
    wireplumber \
    xplr \
    yazi \
    zsh \
    zsh \
    zsh-theme-powerlevel10k-git
