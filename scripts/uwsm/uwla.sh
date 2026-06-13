#! /bin/bash

FORCE=0
FF=0

while getopts 'fF' flag; do
    case "${flag}" in
        f) FORCE=1 ;;
        F) FF=1 ;;
        *) echo "Usage: $0 [-f] [-F] command args..."; exit 1 ;;
    esac
done

shift $((OPTIND - 1))

if [ $# -eq 0 ]; then
    echo "No command provided"
    exit 1
fi

if [[ "${IS_UWSM}" == "1" || $FF -eq 1 ]]; then
    if command -v uwsm-app >/dev/null 2>&1 && [[ $FORCE -eq 1 ]]; then
        uwsm-app -- "$@" &
    else
        uwsm app -- "$@" &
    fi
else 
    "$@" &
fi

