#! /usr/bin/zsh 

# NOTE: for when it is flatpak run
# proc=$(ps aux | rg 'pwvucontrol' | rg -v 'rg|--|zsh')

proc=$( ps aux | rg 'pwvucontrol' | rg -v 'nvim|rg|defunct|zsh')
if [[ -z "$proc"  ]]; then
    if [[ $IS_UWSM -eq 1 ]]; then
        uwsm app -- pwvucontrol
    else
        pwvucontrol
    fi
else
    kill $(echo $proc | awk '{print $2}')
fi
