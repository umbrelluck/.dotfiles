#!/usr/bin/env zsh

if [[ -z "$1" ]]; then
    echo "-gdm +greetd"
    doas systemctl disable gdm
    doas systemctl enable greetd
else
    echo "+gdm -greetd"
    doas systemctl disable greetd
    doas systemctl enable gdm
fi

