#! /bin/bash


REVERSE=0

while getopts "r" opt; do
    case $opt in
        r)
            REVERSE=1
            ;;
        *)
            echo "Flags: -r to reverse"
            exit 1
            ;;
    esac
done

tmp=4800
hour=$(date +%H)

if [[ $hour -ge 21 || $hour -lt 9 ]]; then
    if [[ $REVERSE -eq 0 ]]; then
        hyprctl hyprsunset temperature $tmp
        notify-send "Temperature is ${tmp}°K" -u low
    else
        hyprctl hyprsunset identity
        notify-send "Temperature is restored" -u low
    fi
elif [[ $hour -ge 9 ]]; then
    if [[ $REVERSE -eq 0 ]]; then
        hyprctl hyprsunset identity
        notify-send "Temperature is restored" -u low
    else
        hyprctl hyprsunset temperature $tmp
        notify-send "Temperature is ${tmp}°K" -u low
    fi
fi
