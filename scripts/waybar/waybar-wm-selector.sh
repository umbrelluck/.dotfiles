#! /bin/bash

WM=""
if [[ -n $(pgrep -f hyprland) ]]; then
    WM="hyprland" 
elif [[ -n $(pgrep -f niri) ]]; then
    WM="niri"
fi

for file in "$HOME/.config/waybar/$WM/"*; do
    filename=$(basename "$file")
    echo "$filename"
    if [[ "$filename" =~ config || "$filename" =~ style ]]; then  
        target="$HOME/.config/waybar/$filename"

        if [[ ! -L "$target" || "$(readlink -f "$target")" != "$(readlink -f "$file")" ]]; then
            ln -sf "$file" "$target"
            echo "Linked: $target → $file"
        else
            echo "Link is already for the current WM: $target"
        fi
    fi
done



