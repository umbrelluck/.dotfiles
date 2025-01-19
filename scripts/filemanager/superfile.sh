#! /usr/bin/bash

CMD=("alacritty")
[[ $IS_UWSM -eq 1 ]] && {
    [[ -n $(command -v uwsm-app 2>/dev/null) ]] \
    && CMD=("uwsm-app" "--" "alacritty") \
    || CMD=("uwsm app" "--" "alacritty")
}

"${CMD[@]}" --class 'file-manager' -e 'spf'
