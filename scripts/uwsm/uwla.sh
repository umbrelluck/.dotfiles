#! /bin/bash

FORCE=0
while getopts 'f' flag; do
    case $flag in
        f)
            FORCE=1
            ;;
        *)
            echo "Wrong flag, only -f"
            ;;
    esac
done


if [[ $IS_UWSM -eq 1 ]]; then
    if [[ -n $(command -v uwsm-app 2>/dev/null) && $FORCE -eq 0 ]]; then
        uwsm-app -- "$@" &
    else
        uwsm app -- "$@" &
    fi
else 
    "$@" &
fi
