#! /usr/bin/bash

FF=0

while getopts "F" flag; do
    case ${flag} in
        F)
            FF=1
            ;;
        *)
            echo "Valid flags: -F"
            ;;
    esac
done

CMD=("alacritty")
[[ $IS_UWSM -eq 1 || $FF -eq 1 ]] && {
    [[ -n $(command -v uwsm-app 2>/dev/null) ]] \
    && CMD=("uwsm-app" "--" "alacritty") \
    || CMD=("uwsm app" "--" "alacritty")
}

"${CMD[@]}" --class 'file-manager' -e 'spf' &
