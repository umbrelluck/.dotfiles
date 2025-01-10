#! /usr/bin/zsh

if [[ -z "$(pgrep -f 'alacritty --class updates_install')" ]]; then
    uwla alacritty --class updates_install -e paru > /tmp/UPDATES.log \
fi

