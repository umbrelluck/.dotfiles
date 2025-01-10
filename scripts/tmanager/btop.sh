#!/usr/bin/env zsh

proc=$(ps aux | grep 'alacritty' | grep '-e btop')
if [[ -z "$proc"  ]]; then
    uwla alacritty --class 'btop' -e 'btop'
else
    kill $(echo $proc | awk '{print $2}')
fi
