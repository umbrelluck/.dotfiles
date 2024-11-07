#! /usr/bin/zsh 


proc=$(ps aux | rg 'pwvucontrol' | rg -v 'rg|--|zsh')
if [[ -z "$proc"  ]]; then
    flatpak run com.saivert.pwvucontrol
else
    kill $(echo $proc | awk '{print $2}')
fi
