#! /bin/bash

[[ $IS_UWSM -eq 1 ]] && CMD="uwsm app -- bash" || "bash"

DIR="$HOME/.dotfiles/scripts/hyprland/autostart"

EXCLUDED_FILES=("portal-relaunch" "plasmapolkitagent" "cliphist")

EXCLUDE_PATTERN=$(printf "|%s" "${EXCLUDED_FILES[@]}")
EXCLUDE_PATTERN="${EXCLUDE_PATTERN:1}" 

for script in "$DIR"/*; do
  if [[ ! "$(basename "$script")" =~ $EXCLUDE_PATTERN ]]; then
    $CMD "$script" &
  fi
done
