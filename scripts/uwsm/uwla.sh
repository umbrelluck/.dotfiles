#! /bin/bash

FORCE=0 # force uwsm-app instead of uwsm app
FF=0    # force uwsm app -- as if is_uwsm is set

while getopts 'fF' flag; do
    case $flag in
        f)
            FORCE=1
            shift
            ;;
        F)
            FF=1
            shift
            ;;
        *)
            echo "Wrong flag, only -f and -r"
            ;;
    esac
done


if [[ $IS_UWSM -eq 1 || $FF -eq 1 ]]; then
    if [[ -n $(command -v uwsm-app 2>/dev/null) && $FORCE -eq 0 ]]; then
        uwsm-app -- "$@" &
    else
        uwsm app -- "$@" &
    fi
else 
    "$@" &
fi

