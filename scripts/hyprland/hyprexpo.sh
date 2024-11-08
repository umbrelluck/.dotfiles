#! /usr/bin/zsh

if [[ $(hyprctl dispatch hyprexpo:expo toggle) != "ok" ]]; then
    notify-send "Hyprpm" "Staring update"
    hyprpm update 
    notify-send "Hyprpm" "Updated all plugins"
fi
