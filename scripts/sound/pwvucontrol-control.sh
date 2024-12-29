#! /bin/bash

[[ $# -lt 1 ]] && echo "Requires flags to work" >&2

left-click() {
    # NOTE: for remembering volume level needs to remain active
    
    proc=$(ps aux | rg 'pwvucontrol' | rg -v 'nvim|rg|defunct|.*sh')
    if [[ -z "$proc" ]]; then
        if [[ $IS_UWSM -eq 1 ]]; then
            hyprctl dispatch exec "[workspace special:pwvu] uwsm app -- pwvucontrol"
        else
            hyprctl dispatch exec [workspace special:pwvu] pwvucontrol
        fi
    else
        hyprctl dispatch togglespecialworkspace pwvu
    fi
}

right-click(){
    proc=$( ps aux | rg 'pwvucontrol' | rg -v 'nvim|rg|defunct|.*sh')
    if [[ -n "$proc" && -n $(hyprctl activewindow | grep special:pwvu) ]]; then
        kill "$(echo "$proc" | awk '{print $2}')"
    else
        bash ~/.dotfiles/scripts/sound/wpctl-control.sh -t
    fi
}

while getopts "lr" opt; do
    case $opt in 
        l)
            left-click
            ;;
        r)
            right-click
            ;;
        *) 
            echo "Allowed flags: lr"
            ;;
    esac
done
