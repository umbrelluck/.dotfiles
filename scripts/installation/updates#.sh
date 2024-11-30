#! /usr/bin/zsh

# printf '{"text": "0", "class": "loading"}'

if ! pacman_upd=$(checkupdates 2>/dev/null | wc -l); then
    pacman_upd=0
fi


if ! aur_upd=$(paru -Qu 2>/dev/null | wc -l); then
    aur_upd=0
fi


updates_total=$(($pacman_upd+$aur_upd))

[[ $updates_total -gt 0 ]] && class="yes" || class="no"

printf '{"text": "%s", "class": "%s"}' "$updates_total" "$class"
