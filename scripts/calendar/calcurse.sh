#!/usr/bin/env zsh

proc=$(ps aux | grep 'alacritty' | grep '-e calcurse')
if [[ -z "$proc"  ]]; then
    if [[ $IS_UWSM -eq 1 ]]; then
        uwsm app -- alacritty --class 'calendar' -e 'calcurse'
    else
        alacritty --class 'calendar' -e 'calcurse'
    fi
else
    kill $(echo $proc | awk '{print $2}')
fi
