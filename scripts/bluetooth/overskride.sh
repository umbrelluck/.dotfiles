#! /bin/bash

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

# NOTE: way to fockin loud fans
CMD=("overskride")
[[ $IS_UWSM -eq 1 || $FF -eq 1 ]] && {
    [[ -n $(command -v uwsm-app) ]] \
    && CMD=("uwsm-app" "--" "overskride") \
    || CMD=("uwsm app" "--" "overskride")
}

proc=$(ps aux | rg 'overskride' | rg -v 'nvim|rg|defunct|.*sh')
if [[ -z "$proc" ]]; then
    "${CMD[@]}" &
else
    kill "$(echo "$proc" | awk '{print $2}')"
fi

