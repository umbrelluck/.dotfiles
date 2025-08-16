#! /bin/zsh


[[ $# -lt 1 ]] && echo "Requires flags to work" >&2


while getopts "udtsie" opt; do
    case $opt in
        u)
            wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+
            ;;
        d)
            wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%-
            ;;
        t)
            wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
            ;;
        s)
            wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
            ;;
        i)
            wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SOURCE@ 5%+
            ;;
        e)
            wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SOURCE@ 5%-
            ;;
        *) 
            echo "Allowed flags: u, d, t, s, i, s"
            ;;
    esac
done
