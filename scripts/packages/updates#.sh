#! /bin/sh

if ! pacman_upd=$(checkupdates 2>/dev/null | wc -l); then
    pacman_upd=0
fi


if ! aur_upd=$(paru -Qu 2>/dev/null | wc -l); then
    aur_upd=0
fi


updates_total=$(($pacman_upd+$aur_upd))

class="yes"
if [[ $updates_total -eq 0 ]]; then
    class="no"
fi

printf '{"text": "%s", "class": "%s"}' "$updates_total" "$class"
