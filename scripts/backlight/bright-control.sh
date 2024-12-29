#! /bin/zsh


[[ $# -lt 1 ]] && echo "Requires flags to work" >&2


CRIT=2400 #10%
INC=10
MIN=2 
DEVICE_MIN=240 #1%
while getopts "udn" opt; do
    case $opt in
        u)
            [[ $(brightnessctl g) -lt $CRIT ]] && brightnessctl set $CRIT || brightnessctl set +$INC%
            ;;
        d)
            [[ $(brightnessctl g) -gt $CRIT ]] && brightnessctl set $INC%- || brightnessctl set $MIN%
            ;;
        n)
            brightnessctl -n $DEVICE_MIN
            ;;
        *) 
            echo "Allowed flags: u, d, n"
            ;;
    esac
done

