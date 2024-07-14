#! /bin/sh

if ! pacman_upd=$(checkupdates 2>/dev/null | wc -l); then
    pacman_upd=0
fi


if ! aur_upd=$(paru -Qu 2>/dev/null | wc -l); then
    aur_upd=0
fi


updates_total=$(($pacman_upd+$aur_upd))

printf '{"text": "%s", "tooltip": "Click to update your system"}' "$updates_total"
