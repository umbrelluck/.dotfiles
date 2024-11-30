#! /usr/bin/zsh

[[ "$(pgrep -f 'alacritty --class updates_install')" ]] \
    || alacritty --class updates_install -e paru > ~/update_log.txt

