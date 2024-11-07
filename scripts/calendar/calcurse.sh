#!/usr/bin/env zsh

proc=$(ps aux | grep 'alacritty' | grep '-e calcurse')
if [[ -z "$proc"  ]]; then
    alacritty --class 'calendar' -e 'calcurse'
else
    kill $(echo $proc | awk '{print $2}')
fi
