#! /usr/bin/zsh

CWD=$(pwd)

cd $GITDIR/_themes/Orchis-kde/
git pull

cd $GITDIR/_themes/Orchis-theme/
git pull
./install.sh --tweaks compact solid macos
./install.sh --tweaks compact solid macos -c dark -l

cd $CWD

