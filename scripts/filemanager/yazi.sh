#! /usr/bin/bash

CMD=("ghostty")
[[ $IS_UWSM -eq 1 ]] && {
    [[ -n $(command -v uwsm-app 2>/dev/null) ]] \
    && CMD=("uwsm-app" "--" "ghostty") \
    || CMD=("uwsm app" "--" "ghostty")
}

"${CMD[@]}" --class="file-manager" -e 'yazi'

