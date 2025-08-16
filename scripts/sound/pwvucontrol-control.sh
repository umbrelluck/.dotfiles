#! /bin/bash

FF=0
L=0
R=0

while getopts "lrF" opt; do
    case $opt in 
        F)
            FF=1
            ;;
        l)
            L=1 # left-click
            ;;
        r)
            R=1 # right-click
            ;;
        *) 
            echo "Allowed flags: lrF"
            ;;
    esac
done

[[ $# -lt 1 ]] && echo "Requires flags to work" >&2
[[ $L -eq 0 && $R -eq 0 ]] && echo "Requires flags lr to work" >&2

CMD="pwvucontrol"
[[ $IS_UWSM -eq 1 || $FF -eq 1 ]] && {
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

[[ $L -eq 1 ]] && left-click || right-click
