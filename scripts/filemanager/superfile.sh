#! /usr/bin/bash

if [[ $IS_UWSM -eq 1 ]]; then
    uwsm app -- alacritty --class 'file-manager' -e 'spf'
else
    alacritty --class 'file-manager' -e 'spf'
fi
