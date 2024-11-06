#! /usr/bin/zsh

# printf '{"text": "0", "class": "loading"}'

waiting=$(dunstctl count waiting)
hist=$(dunstctl count history)
displayed=$(dunstctl count displayed)

total=$(($waiting+$hist+$displayed))

[[ $total -gt 0 ]] && class="yes" || class="no"

printf '{"text": "%s", "class": "%s"}' "$total" "$class"
