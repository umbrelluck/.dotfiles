#! /usr/bin/zsh

echo "-----< PLUGINS >-----"

if [[ -d "$HOME/.tmux" && ! -d "$HOME/.tmux/plugins/tpm/.git" ]]; then
    echo "Installing tmux plugin manager ..."
    mkdir -p "$HOME/.tmux/plugins"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo "Done"
echo "-------------------------"
