#! /usr/bin/zsh

! hyprctl dispatch hyprexpo:expo toggle \
    && hyprm update \
    && notify-send "Hyprpm" "Update all plugins"
