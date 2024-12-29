#! /usr/bin/zsh

if [[ -z "$(pgrep -f 'alacritty --class updates_install')" ]]; then
    [[ ! $IS_UWSM -eq 1 ]] && alacritty --class updates_install -e paru > /tmp/UPDATES.log \
    || uwsm app -- alacritty --class updates_install -e paru > /tmp/UPDATES.log
fi

