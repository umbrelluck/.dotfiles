#! /usr/bin/sh

CWD=$(pwd)

cd ~/ProgramFiles/ || exit 1
sh ~/.dotfiles/scripts/installation/github_latest.sh GloriousEggroll/wine-ge-custom/releases .tar.xz

tar -xf wine-lutris-GE* -C ~/.local/share/lutris/runners/wine/
rm -rf wine-lutris-GE*

cd "$CWD" || exit 1
