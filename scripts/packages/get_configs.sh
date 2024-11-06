#! /usr/bin/zsh

confd="$XDG_CONFIG_HOME"
dotdir="$HOME/.dotfiles"

mkdir -p "$confd/alacritty/a_themes" 
stow -t "$confd/alacritty" alacritty 
if [ ! -d "$confd/alacritty/a_themes" ]; then 
    git clone https://github.com/alacritty/alacritty-theme "$confd/alacritty/a_themes"
else
    echo "Updating existing alacritty themes"
    git --git-dir="$HOME/.dotfiles/.git/" --work-tree="$HOME/.dotfiles/" pull
fi

mkdir -p "$confd/nvim"
stow -t "$confd/nvim" "$dotdir/nvim"

mkdir -p "$confd/paru"
stow -t "$confd/paru" "$dotdir/paru"

mkdir -p "$confd/qtile"
stow -t "$confd/qtile" "$dotdir/qtile"

mkdir -p "$confd/ranger"
stow -t "$confd/ranger" "$dotdir/ranger"

mkdir -p "$confd/X11"
stow -t "$confd/X11" "$dotdir/X11"

mkdir -p "$confd/xplr"
stow -t "$confd/xplr" "$dotdir/xplr"

mkdir -p "$confd/hypr"
# stow -t "$confd/hypr" "$dotdir/hyprland"
stow -t "$confd/hypr" "$dotdir/hypr"

mkdir -p "$confd/yazi"
stow -t "$confd/yazi" "$dotdir/yazi"

mkdir -p "$confd/waybar"
stow -t "$confd/waybar" "$dotdir/waybar"

mkdir -p "$confd/walker"
stow -t "$confd/walker" "$dotdir/walker"

mkdir -p "$confd/dunst"
stow -t "$confd/dunst" "$dotdir/dunst"

mkdir -p "$confd/wlogout"
stow -t "$confd/wlogout" "$dotdir/wlogout"

stow -t "$HOME" "$dotdir/gdu"
doas cp "$HOME/.dotfiles/gdu/.gdu.yaml" /root

cp ./git/.gitconfig "$HOME"
echo "Do not forget to add user section in .gitconfig"

# if [ ! -d "/etc/lemurs/wms" ] || [ ! -d "/etc/lemurs/wayland" ]; then
echo "Lemurs setup needs password to write files"
sudo cp "$HOME/.dotfiles/lemurs/xsetup.sh" "/etc/lemurs/xsetup.sh"
sudo cp "$HOME/.dotfiles/lemurs/config.toml" "/etc/lemurs/config.toml"
sudo cp -r "$HOME/.dotfiles/lemurs/wms" "/etc/lemurs/wms"
sudo cp -r "$HOME/.dotfiles/lemurs/wayland" "/etc/lemurs/wayland"
# fi

echo "Greetd need permission to write files"
sudo mkdir -p /etc/greetd/
sudo cp "$HOME/.dotfiles/greetd/config.toml" "/etc/greetd/"

echo "Reflector needs password to write files"
sudo cp "$HOME/.dotfiles/reflector/refletor.conf" "/etc/xdg/reflector/reflector.conf"
sudo systemctl enable reflector.timer
sudo systemctl start reflector.timer

stow -t "$HOME" "$dotdir/tmux"
if [ ! -d "$HOME/.tmux/plugins/tpm/.git" ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# stow -t "$HOME" scripts 
stow -t "$HOME" "$dotdir/powerlevel10k"
stow -t "$HOME" "$dotdir/zsh" 
source ~/.zshrc && . "$SCRSDIR/zsh_plugin&script_downloader.sh"

