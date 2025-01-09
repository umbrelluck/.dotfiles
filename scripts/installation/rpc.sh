#! /bin/bash

echo "Checking for orphans..."
[[ -n $(pacman -Qdt) ]] && sudo pacman -Rns "$(pacman -Qdtq)" || printf "\033[0;35m\nNo orphans to remove\n"

