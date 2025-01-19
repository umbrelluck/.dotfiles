#! /bin/bash

[[ $# -lt 1 ]] && echo "Requires flags to work" >&2

CMD="pwvucontrol"
[[ $IS_UWSM -eq 1 ]] && {
    [[ -n $(command -v uwsm-app 2>/dev/null) ]] \
    && CMD="uwsm-app -- pwvucontrol" \
    || CMD="uwsm app -- pwvucontrol"
}

left-click() {
    # NOTE: for remembering volume level needs to remain active
    
    proc=$(ps aux | rg 'pwvucontrol' | rg -v 'nvim|rg|defunct|.*sh')
    if [[ -z "$proc" ]]; then
        hyprctl dispatch exec "[workspace special:pwvu] $CMD"
    else
        hyprctl dispatch togglespecialworkspace pwvu
    fi
}

right-click(){
    proc=$(ps aux | rg 'pwvucontrol' | rg -v 'nvim|rg|defunct|.*sh')
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
