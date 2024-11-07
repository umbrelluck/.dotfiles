#! /usr/bin/bash

CURD=$(pwd)

cd ~/Git/WhiteSur-gtk-theme/
git pull
install.sh
install.sh -l

cd ~/Git/WhiteSur-kde/
git pull
install.sh

cd "$CURD"
