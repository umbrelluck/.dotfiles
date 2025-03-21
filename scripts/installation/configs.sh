#! /usr/bin/zsh

IS_HOME=0
IS_CONF=0
IS_ETC=0
IS_UWSM=0
IS_DESKTOP=0
IS_SCRIPTS=0

# TODO: default all i except UWSM

while getopts "acoeuds" flag; do
    case $flag in
        a) 
            IS_HOME=1
            IS_CONF=1
            IS_ETC=1
            IS_DESKTOP=1
            IS_SCRIPTS=1
            ;;
        o) 
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
        d) 
            IS_DESKTOP=1
            ;;
        s) 
            IS_SCRIPTS=1
            ;;
        *)
            echo "No such flag: only -a -c -o -e -u -d -s"
            exit 1
    esac
done

confd="$XDG_CONFIG_HOME"
CWD=$(pwd)

[[ ! -d "$HOME/.dotfiles/logs" ]] && mkdir "$HOME/.dotfiles/logs"

echo "-----< CONFIGS >-----"
cd "$HOME/.dotfiles/home"

if [[ $IS_HOME -eq 1 ]]; then
    echo "Linking configs to $HOME ..."
    for direct in *(/); do
        [[ $direct != "git" ]] && {
            stow "$direct" -t "$HOME/"
            echo "\t\t$direct .. Done"
        }
    done
    [[ ! -f "$HOME/.gitconfig" ]] && {
        cp "git/.gitconfig" "$HOME"
        echo "\t\t.gitconfig .. Done"
        echo "\t\tDo not forget to add user.name and user.email"
    }
    echo "Linking scripts to $HOME ..."
    cd "$HOME/.dotfiles/"
    mkdir -p "$HOME/.scripts"
    stow "scripts" -t "$HOME/.scripts"
fi

cd "$HOME/.dotfiles/"

if [[ $IS_CONF -eq 1 ]]; then
    echo "Linking configs to $HOME/.config ..."
    stow "config" -t "$HOME/.config/"
fi

if [[ $IS_DESKTOP -eq 1 ]]; then
    echo "Linking desktop files to $XDG_DATA_HOME/applications/"
    stow "desktop" -t "$XDG_DATA_HOME/applications/"
    update-desktop-database "$XDG_DATA_HOME/applications/"
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
    sudo cp "$HOME/.dotfiles/etc/udev"/* "/etc/udev/rules.d/" && sudo udevadm control --reload
    echo "\t\tUdev rules .. Done"
    sudo cp "$HOME/.dotfiles/etc/hooks"/* "/etc/pacman.d/hooks/"
    echo "\t\tPacman hooks .. Done"
fi

[[ $IS_SCRIPTS -eq 1 ]] && {
    echo "Copying scripts to /usr/local/bin/"
    sudo cp "scripts/bin/uuctl-c" "/usr/local/bin"
    echo "\t\tuuctl-c .. Done"
    sudo cp "scripts/bin/uwla" "/usr/local/bin"
    echo "\t\tuwla .. Done"
    sudo cp "scripts/bin/uwstop" "/usr/local/bin"
    echo "\t\tuwstop .. Done"
}

# Alacritty themes here: https://github.com/alacritty/alacritty-theme

# if [[ $IS_CONF -eq 1 && $IS_UWSM -eq 1 ]]; then
#     rm "$confd/hypr/hyprland.conf"
#     ln -s "$HOME/.dotfiles/config/hypr/hyprland_uwsm.conf" "$confd/hypr/hyprland.conf"
#     hyprctl reload
# elif [[ $IS_CONF -eq 1 ]]; then
#     rm "$confd/hypr/hyprland.conf"
#     ln -s "$HOME/.dotfiles/config/hypr/hyprland_standalone.conf" "$confd/hypr/hyprland.conf"
#     hyprctl reload
# fi

cd "$CWD"

echo "Done"
echo "-------------------------"

