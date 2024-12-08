#! /usr/bin/zsh

MONITOR_NAME="eDP-1"
HYPRPAPER_CONF_FILE="$HOME/.dotfiles/config/hypr/hyprpaper.conf"
WALLPAPER_NAME=$(head -n 1 $HOME/.config/hypr/hall/hypr-colors.conf | awk '{print $3}')

echo -e "preload = $WALLPAPER_NAME \nwallpaper = $MONITOR_NAME, $WALLPAPER_NAME" > $HYPRPAPER_CONF_FILE

killall hyprpaper
hyprpaper&
