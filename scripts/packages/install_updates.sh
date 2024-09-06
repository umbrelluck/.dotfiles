#! /usr/bin/zsh

# ! pidof -x "paru" >/dev/null && alacritty --class 'updates_install' -e 'paru'
# [[ -z $(hyprctl clients | rip 'updates_install') ]] && alacritty --class 'updates_install' -e 'paru'
[[ "$(pgrep -f 'alacritty --class updates_install')" ]] \
    || alacritty --class updates_install -e paru > ~/update_log.txt
    # || alacritty --class updates_install -e bat ~/update_log.txt

