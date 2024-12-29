#! /bin/zsh


[[ $# -lt 1 ]] && echo "Requires flags to work" >&2


INC=10
MIN=1
while getopts "udn" opt; do
    case $opt in
        u)
            light -A $INC
            ;;
        d)
            light -U $INC
            ;;
        n)
            light -N $MIN
            ;;
        *) 
            echo "Allowed flags: u, d, n"
            ;;
    esac
done


