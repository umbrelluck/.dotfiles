#!/usr/bin/zsh

systemctl --user add-wants niri.service dunst.service
systemctl --user add-wants niri.service waybar.service

# FIXME:--gaplication-service prevents obsidian from lauching
# systemctl --user add-wants niri.service walker.service
systemctl --user add-wants niri.service udiskie.service
systemctl --user add-wants niri.service copyq.service

systemctl --user add-wants niri.service hypridle.service
systemctl --user add-wants niri.service hyprpaper.service
systemctl --user add-wants niri.service hyprsunset.service
systemctl --user add-wants niri.service hyprpolkitagent.service

