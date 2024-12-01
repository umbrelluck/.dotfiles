#! /usr/bin/zsh 

proc=$(ps aux | rg 'pwvucontrol' | rg -v 'rg|--|zsh')
if [[ -z "$proc"  ]]; then
    if [[ $IS_UWSM -eq 1 ]]; then
        uwsm app -- flatpak run com.saivert.pwvucontrol
    else
        flatpak run com.saivert.pwvucontrol
    fi
else
    kill $(echo $proc | awk '{print $2}')
fi
