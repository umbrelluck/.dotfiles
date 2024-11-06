#! /usr/bin/bash

CURD=$(pwd)

z ~/Git/WhiteSur-gtk-theme/
git pull
install.sh
install.sh -l

z ~/Git/WhiteSur-kde/
git pull
install.sh

z "$CURD"
