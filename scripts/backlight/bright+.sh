#! /usr/bin/zsh

[[ $(brightnessctl g) -lt 4800 ]] && brightnessctl set 10% || brightnessctl set +10%
