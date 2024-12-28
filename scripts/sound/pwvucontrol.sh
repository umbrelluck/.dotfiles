#! /usr/bin/zsh 

# NOTE: for when it is flatpak run
# proc=$(ps aux | rg 'pwvucontrol' | rg -v 'rg|--|zsh')

# NOTE: for remembering volume level needs to remain active

proc=$( ps aux | rg 'pwvucontrol' | rg -v 'nvim|rg|defunct|zsh')
if [[ -z "$proc"  ]]; then
    if [[ $IS_UWSM -eq 1 ]]; then
        hyprctl dispatch exec "[workspace special:pwvu] uwsm app -- pwvucontrol"
    else
        hyprctl dispatch exec [workspace special:pwvu] pwvucontrol
    fi

else
    # kill $(echo $proc | awk '{print $2}')
    hyprctl dispatch togglespecialworkspace pwvu
fi
