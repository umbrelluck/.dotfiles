#!/usr/bin/envbash


install_gnome(){
    sudo pacman -S gnome
}
install_hypr(){
    sudo pacman -S \
        hyprcursor \
        hypridle \
        hyprland \
        hyprlock \
        hyprutils \
        lemurs \
        rofi-wayland \
        waybar \
        xdg-desktop-portal-hyprland


    paru \
        hyprpicker
}

enable_gnome(){
    sudo systemctl enable gdm
}

disable_gnome(){
    sudo systemctl disable gdm
}

enable_hypr(){
    sudo systemctl enable lemurs
}

disable_hypr(){
    sudo systemctl disable lemurs
}

gdm=0
hypr=0

while getopts gG:hH: flag
do
    case "${flag}" in
        g)  install_gnome;;
        G) gdm=${OPTARG};;
        h) install_hypr;;
        H) hypr=${OPTARG};;
    esac
done

if [[ "$gdm" -eq "0" ]]; then
    disable_gnome
elif [[ "$gdm" -eq "1" ]]; then
    enable_gnome 
else echo "Incorrect gdm activate flag value"
fi

if [[ "$hypr" -eq "0" ]]; then
    disable_hypr
elif [[ "$hypr" -eq "1" ]]; then
    enable_hypr 
else echo "Incorrect hypr activate flag value"
fi

# TODO: add wireplumber audio controll


