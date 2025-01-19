#! /usr/bin/zsh


CMD=("alacritty")
[[ $IS_UWSM -eq 1 ]] && {
    [[ -n $(command -v uwsm-app) ]] \
    && CMD=("uwsm-app" "--" "alacritty") \
    || CMD=("uwsm app" "--" "alacritty")
}

proc=$(ps aux | grep 'alacritty' | grep '-e bluetuith')
if [[ -z "$proc"  ]]; then
    ${CMD[@]} --class 'bluetuith' -e 'bluetuith'
else
    kill $(echo $proc | awk '{print $2}')
fi

