#!/usr/bin/env zsh

cwd=$(pwd)

if [[ ! -d $ZDOTDIR/.zsh/plugins ]]; then
    mkdir $ZDOTDIR/.zsh/plugins && cd $ZDOTDIR/.zsh/plugins
fi

cd $ZDOTDIR/.zsh/plugins

if [[ ! -d zsh-autosuggestions/ ]]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions
fi

if [[ ! -d zsh-syntax-highlighting/ ]]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
fi

# cd $SCRSDIR
# if [[ ! -d $SCRSDIR/rofi-power-menu/ ]]; then
#     git clone https://github.com/jluttine/rofi-power-menu.git
#     cp rofi-power-menu $HOME/.local/bin/rofi-power-menu
# elif [[ -z "$HOME/.local/bin/rofi-power-menu" ]]; then
#     cp rofi-power-menu $HOME/.local/bin/rofi-power-menu
# fi

cd $cwd
echo "Done"
