#! /bin/bash

if [[ $IS_UWSM -eq 1 ]]; then
    uwsm stop
else 
    exit
fi

