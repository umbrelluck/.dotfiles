#! /bin/bash

if [[ $1 -eq 0 ]]; then
    notify-send 'Changing Power States' 'Using battery power'
    pw-cat -p /usr/share/sounds/freedesktop/stereo/power-unplug.oga
elif [[ $1 -eq 1 ]]; then
    notify-send -u low 'Changing Power States' 'Using AC power'
    pw-cat -p /usr/share/sounds/freedesktop/stereo/power-plug.oga
fi
