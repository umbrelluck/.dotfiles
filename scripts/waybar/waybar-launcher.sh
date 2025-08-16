#! /bin/bash

IS_RELOADED=0
TO_FORCE=0
FF=0
while getopts 'tfFC' flag; do
    case "$flag" in
        t)
            killall -SIGUSR1 waybar
            IS_RELOADED=1
            ;;
        f) 
            TO_FORCE=1
            ;;
        F)
            FF=1
            ;;
        *)
            echo "Invalid flag, only -t -f -F"
            ;;
    esac
done

# FIXME: Think about how to implement waybar for every wm
# this scripts works with HYPRLAND

# WM=""
# if [[ -n $(pgrep -f hyprland) ]]; then
#     WM="hyprland" 
# elif [[ -n $(pgrep -f niri) ]]; then
#     WM="niri"
# fi

CMD="waybar"
# FIXME: bad with uwsm
[[ $IS_UWSM -eq 1 || $FF -eq 1 ]] && {
    [[ -n $(command -v uwsm-app) && $TO_FORCE -eq 0 ]] \
    && CMD="uwsm-app -- waybar" \
    || CMD="uwsm app -- waybar"
}

# CMD="$CMD -c $HOME/.config/waybar/$WM/config.jsonc"
# CMD="$CMD -s $HOME/.config/waybar/$WM/style.css"

[[ "$IS_RELOADED" -eq 1 ]] && exit
[[ -z $(pidof waybar) ]] && { ${CMD}& } || killall -SIGUSR2 waybar
