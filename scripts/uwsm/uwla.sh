#! /bin/bash

if [[ $IS_UWSM -eq 1 ]]; then
    uwsm app -- "$@"
else 
    "$@"
fi
