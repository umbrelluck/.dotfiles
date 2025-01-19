#! /bin/bash


[[ $# -lt 1 ]] && echo "Requires flags to work" >&2


CRIT=2400 #10%
INC=10
MIN=2 
DEVICE_MIN=240 #1%
while getopts "udr" opt; do
    case $opt in
        u)
            brightnessctl -d asus::kbd_backlight s +1
            ;;
        d)
            brightnessctl -d asus::kbd_backlight s 1- 
            ;;
        r)
            brightnessctl -d asus::kbd_backlight s 1 -s
            ;;
        *) 
            echo "Allowed flags: u, d, n"
            ;;
    esac
done


