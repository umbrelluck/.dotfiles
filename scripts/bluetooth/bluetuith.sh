#! /usr/bin/zsh

proc=$(ps aux | grep 'alacritty' | grep '-e bluetuith')
if [[ -z "$proc"  ]]; then
    if [[ $IS_UWSM -eq 1 ]]; then
        uwsm app -- alacritty --class 'bluetuith' -e 'bluetuith'
    else 
        alacritty --class 'bluetuith' -e 'bluetuith'
    fi
else
    kill $(echo $proc | awk '{print $2}')
fi

