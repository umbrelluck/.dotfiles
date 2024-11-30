#! /usr/bin/zsh

# FIX: redo the whole thing

enabled=false

install_gnome(){
    paru -S gnome
}
install_hypr(){
     paru -S \
        hyprcursor \
        hypridle \
        hyprland \
        hyprlock \
        hyprpicker
        hyprutils \
        lemurs \
        rofi-wayland \
        waybar \
        xdg-desktop-portal-hyprland
}

enable_gnome(){
    if ! [[ $enabled ]]; then
        sudo systemctl enable gdm
        enabled=true
    fi
}

disable_gnome(){
    if [[ $(systemctl is-enabled gdm) ]]; then
        sudo systemctl disable gdm
    fi
}

enable_hypr(){
    if ! [[ $enabled ]]; then
        sudo systemctl enable lemurs
        enabled=true
    fi
}

disable_hypr(){
    if [[ $(systemctl is-enabled lemurs) ]]; then
        sudo systemctl disable lemurs
    fi
}

disable_hypr
disable_gnome

while getopts gGhH flag
do
    case "${flag}" in
        g) install_gnome;;
        G) enable_gnome
           ;;
        h) install_hypr;;
        H) enable_hypr
           ;;
        *) echo "Incorrect flag" ;;
    esac
done

# TODO: add wireplumber audio controll


