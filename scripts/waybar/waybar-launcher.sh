#! /bin/bash

IS_RELOADED=0
TO_FORCE=0
while getopts 'tf' flag; do
    case "$flag" in
        t)
            killall -SIGUSR1 waybar
            IS_RELOADED=1
            ;;
        f) 
            TO_FORCE=1
            ;;
        *)
            echo "Invalid flag, only -t -f"
            ;;
    esac
done

CMD="waybar"
[[ $IS_UWSM -eq 1 ]] && {
    [[ -n $(command -v uwsm-app) && $TO_FORCE -eq 0 ]] \
    && CMD="uwsm-app -- waybar" \
    || CMD="uwsm app -- waybar"
}

[[ "$IS_RELOADED" -eq 1 ]] && exit
[[ -z $(pidof waybar) ]] && ${CMD} || killall -SIGUSR2 waybar
