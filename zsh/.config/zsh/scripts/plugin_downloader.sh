#!/usr/bin/env zsh

if [[ ! -d $ZDOTDIR/plugins ]] then
        
    mkdir $ZDOTDIR/plugins && cd $ZDOTDIR/plugins

    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
    git clone https://github.com/zsh-users/zsh-autosuggestions
fi
