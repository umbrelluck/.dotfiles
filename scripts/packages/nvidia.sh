#!/usr/bin/env bash

dkms=0
cuda=0

while getopts dc flag
do
    case "${flag}" in
        # d) dkms=${OPTARG};;
        d) dkms=1;;
        # c) cuda=${OPTARG};;
        c) cuda=1;;
        *) cuda=0; dkms=0;;
    esac
done

if [[ "$dkms" -eq 0 ]]; then
    sudo pacman -S nvidia 
else sudo pacman -S nvidia-dkms
fi

sudo pacman -S nvidia-utils

# TODO: add drm modeset copuinf file
sudo systemctl enable nvidia-suspend.service nvidia-hibernate.service nvidia-resume.service

if [[ "$cuda" -eq 1 ]]; then
    sudo pacman -S cuda cudnn 
fi

