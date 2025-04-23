#! /bin/bash


[[ $# -lt 1 ]] && echo "Requires flags to work" >&2


EDGE=2400 #10%
CRIT=$((EDGE*5/10)) #5%
INC=10
MIN=2 
DEVICE_MIN=240 #1%

level=$(brightnessctl g)

while getopts "udn" opt; do
    case $opt in
        u)
            # [[ $(brightnessctl g) -lt $CRIT ]] && brightnessctl set $CRIT || brightnessctl set +$INC%
            if [[ $level -lt $CRIT ]]; then
                brightnessctl set $CRIT
            elif [[ $level -lt $EDGE ]] ; then
                brightnessctl set $EDGE 
            else
                brightnessctl set +$INC%
            fi
            ;;
        d)
            # if [[ $level -lt $CRIT ]]; then
            #     brightnessctl set $MIN%
            # elif [[ $level -lt $EDGE ]]; then
            #     brightnessctl set $CRIT
            # else
            #     brightnessctl set $INC%-
            # fi
            
            # [[ $(brightnessctl g) -gt $CRIT ]] && brightnessctl set $INC%- || brightnessctl set $MIN%
            # [[ $(brightnessctl g) -gt $EDGE ]] && brightnessctl set $INC%- || [[ $(brightnessctl g) -gt $CRIT ]] && brightnessctl set $CRIT || brightnessctl set $MIN%

            if [[ $level -gt $EDGE ]]; then
                brightnessctl set $INC%-
            elif [[ $level -gt $CRIT ]]; then
                brightnessctl set $CRIT
            else
                brightnessctl set $MIN%
            fi
            ;;
        n)
            brightnessctl -n $DEVICE_MIN
            ;;
        *) 
            echo "Allowed flags: u, d, n"
            ;;
    esac
done

