#! /usr/bin/zsh

CWD=$(pwd)

cd $GITDIR/_themes/Orchis-kde/
git pull

cd $GITDIR/_themes/Orchis-theme/
git pull
./install.sh --tweaks solid macos
./install.sh -l -s compact -c dark --tweaks solid macos

cd $CWD

