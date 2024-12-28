#! /usr/bin/zsh 

proc=$( ps aux | rg 'pwvucontrol' | rg -v 'nvim|rg|defunct|zsh')
if [[ -n "$proc" && -n $(hyprctl activewindow | grep special:pwvu) ]]; then
    kill $(echo $proc | awk '{print $2}')
else
    sh ~/.dotfiles/scripts/sound/wpctl~.sh
fi


