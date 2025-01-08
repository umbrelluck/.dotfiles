#! /usr/bin/zsh

TO_KILL=0

while getopts "k" flag; do
    case $flag in
        k) 
            TO_KILL=1
            ;;
        *)
            echo "No such flag: only -k"
            exit 1
    esac
done

[[ $TO_KILL -eq 0 ]] && hyprctl --instance 0 'keyword misc:allow_session_lock_restore 1' \
    || killall -9 hyprlock

hyprctl --instance 0 'dispatch exec hyprlock'
