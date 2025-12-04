#!/usr/bin/env bash

[[ $# -ne 1 ]] && { 
    echo "requires argument on/off"
    exit 1 
}

if [[ $1 == "on" ]]; then
    wlr-randr --output eDP-1 --dpms on
elif [[ $1 == "off" ]]; then
    wlr-randr --output eDP-1 --dpms on
else 
    echo "Wrong option, only on/off"
fi

