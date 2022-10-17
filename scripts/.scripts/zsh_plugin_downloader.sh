#!/usr/bin/env zsh

if [[ ! -d $ZDOTDIR/plugins ]] then
    mkdir $ZDOTDIR/plugins && cd $ZDOTDIR/plugins
fi

if [[ ! -d $ZDOTDIR/plugins/powerlevel10k/ ]] then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git
fi

if [[ ! -d $ZDOTDIR/plugins/zsh-autosuggestions/ ]] then
    git clone https://github.com/zsh-users/zsh-autosuggestions
fi

if [[ ! -d $ZDOTDIR/plugins/zsh-syntax-highlighting/ ]] then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
fi
