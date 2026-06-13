#! /bin/bash

usage() {
    echo "Usage: searxng [ -d | --down ] [ -u | --update_services ] [ -t | --update-templates ]
               [ -l | --logs ] [ -s | --active-services ] [ -r | root ] [ -h | --help ]

       Wtihout flags starts SearXNG."
    exit 2
}

PARSED_ARGS=$(getopt -n SearXNG -o dutlsrh --long down,update-services,update-templates,logs,active-services,root,help -- "$@")
VALID_ARGUMENTS_EXIT=$?
if [[ "$VALID_ARGUMENTS_EXIT" -ne "0" ]]; then
    usage
fi

DPATH="$HOME/ProgramFiles/searxng"
DFILE="$DPATH/docker-compose.yml"

down() {
    docker compose -f "$DFILE" down
}

update_services(){
    docker compose -f "$DFILE" down
    docker compose -f "$DFILE" pull
    docker compose -f "$DFILE" up -d
}

update_templates(){
    docker compose -f "$DFILE" down
    (cd "$DPATH" && curl -fsSLO \
        https://raw.githubusercontent.com/searxng/searxng/master/container/docker-compose.yml \
        https://raw.githubusercontent.com/searxng/searxng/master/container/.env.example)
    docker compose -f "$DFILE" up -d
}


logs(){
    docker compose logs -f core
}

active-services(){
    docker compose -f "DFILE" ps
}

root(){
    docker compose -f "DFILE" exec -it --user root core /bin/sh -l
}

WAS_RUN=0

eval set -- "$PARSED_ARGS"
while :
do
    case "$1" in
        -d | --down)                WAS_RUN=1 ; down             ; shift ;;
        -u | --update-services)     WAS_RUN=1 ; update-services  ; shift ;;
        -t | --update-templates)    WAS_RUN=1 ; update_templates ; shift ;; 
        -l | --get-logs)            WAS_RUN=1 ; logs             ; shift ;; 
        -s | --get-active-services) WAS_RUN=1 ; active-services  ; shift ;; 
        -r | --root)                WAS_RUN=1 ; root             ; shift ;; 
        -h | --help)                WAS_RUN=1 ; usage            ; shift ;; 
        # -- means the end of the arguments; drop this, and break out of the while loop
        --) shift; break ;;
        # for invalid option, already covered by checking exit status
        *) echo "Unexpected option: $1 - this should not happen."
        usage ;;
esac
done

if [[ "$WAS_RUN" -eq "0" ]]; then
    if ! systemctl is-active docker --quiet && ! systemctl is-active docker.socket --quiet; then
        notify-send "SeacXNG docker asks for elevated permissions for systemctl"
        systemctl start docker 
    fi
    docker compose -f "$DFILE" up -d
fi

