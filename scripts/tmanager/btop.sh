#! /bin/bash

CMD=("alacritty")
[[ $IS_UWSM -eq 1 ]] && {
    [[ -n $(command -v uwsm-app 2>/dev/null) ]] \
    && CMD=("uwsm-app" "--" "alacritty") \
    || CMD=("uwsm app" "--" "alacritty")
}

proc=$(ps aux | grep 'alacritty' | grep '-e btop')
if [[ -z "$proc"  ]]; then
    "${CMD[@]}" --class 'btop' -e 'btop'
else
    kill $(echo "$proc" | awk '{print $2}')
fi
