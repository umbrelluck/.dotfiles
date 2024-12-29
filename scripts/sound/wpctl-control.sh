#! /bin/zsh


[[ $# -lt 1 ]] && echo "Requires flags to work" >&2


while getopts "udt" opt; do
    case $opt in
        u)
            wpctl set-volume -l 1.0 @DEFAULT_SINK@ 5%+
            ;;
        d)
            wpctl set-volume -l 1.0 @DEFAULT_SINK@ 5%-
            ;;
        t)
            wpctl set-mute @DEFAULT_SINK@ toggle
            ;;
        *) 
            echo "Allowed flags: u, d, t"
            ;;
    esac
done
