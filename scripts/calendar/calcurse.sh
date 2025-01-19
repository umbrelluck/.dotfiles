#!/usr/bin/env zsh

CMD=("alacritty")
[[ $IS_UWSM -eq 1 ]] && {
    [[ -n $(command -v uwsm-app) ]] \
    && CMD=("uwsm-app" "--" "alacritty") \
    || CMD=("uwsm app" "--" "alacritty")
}

proc=$(ps aux | grep 'alacritty' | grep '-e calcurse')
if [[ -z "$proc"  ]]; then
     ${CMD[@]} --class 'calendar' -e 'calcurse'
else
    kill $(echo $proc | awk '{print $2}')
fi
