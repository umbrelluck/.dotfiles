#! /usr/bin/zsh

[[ $(brightnessctl g) -lt 2400 ]] && brightnessctl set 10% || brightnessctl set +10%
