#!/usr/bin/zsh

systemctl --user start dunst.service
systemctl --user start waybar.service

# FIXME:--gaplication-service prevents obsidian from lauching
# systemctl start walker.service
systemctl --user start udiskie.service
systemctl --user start copyq.service

# wpaperd

systemctl --user start hypridle.service
systemctl --user start hyprlock.service
systemctl --user start hyprpaper.service
systemctl --user start hyprsunset.service
systemctl --user start hyprpolkitagent.service


