#! /usr/bin/zsh

[[ $(brightnessctl g) -gt 2400 ]] && brightnessctl set 10%- || brightnessctl set 2%
