#! /usr/bin/zsh


[[ $# -lt 1 ]] && echo "Requires flags to work" >&2


while getopts "psnr" opt; do
    case $opt in
        p)
            playerctl play-pause
            ;;
        s)
            playerctl stop
            ;;
        n)
            playerctl next
            ;;
        r)
            playerctl previous
            ;;
        *) 
            echo "Allowed flags: p, s, n, r"
            ;;
    esac
done

# printf '{"class": "%s"}' "$(playerctl status)"
