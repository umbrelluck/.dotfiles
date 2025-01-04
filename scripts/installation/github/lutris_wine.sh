#! /usr/bin/bash

CWD=$(pwd)

cd ~/ProgramFiles/ || exit 1
bash ~/.dotfiles/scripts/installation/github/github_latest.sh \
    GloriousEggroll/wine-ge-custom .tar.xz LoL

if [[ $! -ne 1 ]]; then
    tar -xf wine-lutris-GE* -C ~/.local/share/lutris/runners/wine/
    rm -rf wine-lutris-GE*
fi

cd "$CWD" || exit 1
