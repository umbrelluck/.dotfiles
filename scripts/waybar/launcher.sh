#! /usr/bin/zsh

[[ -z $(pidof waybar) ]] && uwla waybar || killall -SIGUSR2 waybar
