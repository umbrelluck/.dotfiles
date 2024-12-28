#! /usr/bin/bash

CURD=$(pwd)

cd ~/Git/_themes/WhiteSur-gtk-theme/
git pull
./install.sh
./install.sh -l

cd ~/Git/_themes/WhiteSur-kde/
git pull
./install.sh

cd "$CURD"
