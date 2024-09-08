#! /usr/bin/zsh

[[ $(brightnessctl g) -gt 4800 ]] && brightnessctl set 10%- || brightnessctl set 2%
