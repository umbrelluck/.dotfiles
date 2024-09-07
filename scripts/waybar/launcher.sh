#! /usr/bin/zsh

[[ -z $(pidof waybar) ]] && waybar || killall -SIGUSR2 waybar
