#! /usr/bin/zsh

proc=$(ps aux | grep 'alacritty' | grep '-e bluetuith')
if [[ -z "$proc"  ]]; then
    alacritty --class 'bluetuith' -e 'bluetuith'
else
    kill $(echo $proc | awk '{print $2}')
fi

