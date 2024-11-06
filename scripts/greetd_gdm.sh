#!/usr/bin/env zsh

if [[ -z "$1" ]]; then
    echo "-gdm +greetd -sddm"
    doas systemctl disable gdm
    doas systemctl disable sddm
    doas systemctl enable greetd
elif [[ $1 == "1" ]]; then
    echo "+gdm -greetd -sddm"
    doas systemctl disable greetd
    doas systemctl disable sddm
    doas systemctl enable gdm
else
    echo "-gdm -greetd +sddm"
    doas systemctl disable greetd
    doas systemctl enable sddm
    doas systemctl disable gdm
fi

