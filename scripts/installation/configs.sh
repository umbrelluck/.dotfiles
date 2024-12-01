#! /usr/bin/zsh

IS_HOME=0
IS_CONF=0
IS_ETC=0
IS_UWSM=0

# TODO: default all i except UWSM

while getopts "acheu" flag; do
    case $flag in
        a) 
            IS_HOME=1
            IS_CONF=1
            IS_ETC=1
            ;;
        h) 
            IS_HOME=1
            ;;
        c) 
            IS_CONF=1
            ;;
        e)
            IS_ETC=1
            ;;
        u)
            IS_UWSM=1
            ;;
        *)
            echo "No such flag: only -a -c -h -e -u"
            exit 1
    esac
done

confd="$XDG_CONFIG_HOME"
CWD=$(pwd)

echo "-----< CONFIGS >-----"

cd "$HOME/.dotfiles/home"

if [[ $IS_HOME -eq 1 ]]; then
    echo "Linking configs to $HOME ..."
    for direct in *(/); do
        [[ $direct != "git" ]] && stow "$direct" -t "$HOME/"
    done
    [[ ! -f "$HOME/.gitconfig" ]] && cp "git/.gitconfig" "$HOME"
fi

cd ..

if [[ $IS_CONF -eq 1 ]]; then
    echo "Linking configs to $HOME/.config ..."
    stow "config" -t "$HOME/.config/"
fi

if [[ $IS_ETC -eq 1 ]]; then
    echo "Copying configs to /etc ..."
    sudo cp -r "$HOME/.dotfiles/etc/lemurs"/* "/etc/lemurs/"
    echo "\t\tLemurs .. Done"
    sudo mkdir -p /etc/greetd/
    sudo cp -r "$HOME/.dotfiles/etc/greetd"/* "/etc/greetd/"
    echo "\t\tGreetd .. Done"
    sudo cp "$HOME/.dotfiles/etc/reflector/reflector.conf" "/etc/xdg/reflector/reflector.conf"
    echo "\t\tReflector .. Done"
fi

# Alacritty themes here: https://github.com/alacritty/alacritty-theme

[[ $IS_CONF -eq 1 ]] && rm "$confd/hypr/hyprland.conf"
if [[ $IS_CONF -eq 1 && $IS_UWSM -eq 1 ]]; then
    ln -s "$HOME/.dotfiles/config/hypr/hyprland_uwsm.conf" "$confd/hypr/hyprland.conf"
elif [[ $IS_CONF -eq 1 ]]; then
    ln -s "$HOME/.dotfiles/config/hypr/hyprland_standalone.conf" "$confd/hypr/hyprland.conf"
fi

cd "$CWD"

echo "Done"
echo "-------------------------"

