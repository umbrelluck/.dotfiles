#!/usr/bin/env zsh

proc=$(ps aux | grep 'alacritty' | grep '-e btop')
if [[ -z "$proc"  ]]; then
    if [[ $IS_UWSM -eq 1 ]]; then
        uwsm app -- alacritty --class 'btop' -e 'btop'
    else
        alacritty --class 'btop' -e 'btop'
    fi
else
    kill $(echo $proc | awk '{print $2}')
fi
