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

CONFIG_DIR="$XDG_CONFIG_HOME"
DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}"
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
    echo "Linking desktop files to $DATA_DIR/applications/"
    stow "desktop" -t "$DATA_DIR/applications/"
    update-desktop-database "$DATA_DIR/applications/"
fi

copy_if_newer() {
    src="$1"
    dst="$2"
    mode="${3:-user}"

    for file in "$src"/*; do
        base=$(basename "$file")
        target="$dst/$base"

        # TODO:think about making if mode 1 command
        if [[ ! -e "$target" || "$file" -nt "$target" ]]; then
            if [[ $mode == "sudo" ]]; then
                sudo cp -r "$file" "$target"
            else
                cp -r "$file" "$target"
            fi
        fi
    done
}

if [[ $IS_ETC -eq 1 ]]; then
    echo "Copying configs to /etc ..."

    copy_if_newer "$HOME/.dotfiles/etc/lemurs" "/etc/lemurs" "sudo"
    echo "\t\tLemurs .. Done"

    sudo mkdir -p /etc/greetd/
    copy_if_newer "$HOME/.dotfiles/etc/greetd" "/etc/greetd" "sudo"
    echo "\t\tGreetd .. Done"

    sf="$HOME/.dotfiles/etc/reflector/reflector.conf"
    tf="/etc/xdg/reflector/reflector.conf"
    if [[ ! -f "$tf" || "$sf" -nt "$tf" ]]; then
        sudo cp "$sf" "$tf"
    fi
    echo "\t\tReflector .. Done"

    copy_if_newer "$HOME/.dotfiles/etc/udev" "/etc/udev/rules.d" "sudo"
    sudo udevadm control --reload
    sudo udevadm control --reload-rules
    echo "\t\tUdev rules .. Done"

    copy_if_newer "$HOME/.dotfiles/etc/tlp" "/etc" "sudo"
    echo "\t\tTLP .. Done"

    copy_if_newer "$HOME/.dotfiles/etc/hooks" "/etc/pacman.d/hooks"
    echo "\t\tPacman hooks .. Done"
    
    copy_if_newer "$HOME/.dotfiles/etc/systemd" "$CONFIG_DIR/systemd/user"
    echo "\t\tUser systemd .. Done"
fi

[[ $IS_SCRIPTS -eq 1 ]] && {
    echo "Copying scripts to /usr/local/bin/"

    sf="$HOME/.dotfiles/scripts/bin/diffprog-wrapper"
    tf="/usr/local/bin/diffprog-wrapper"
    if [[ ! -f "$tf" || "$sf" -nt "$tf" ]]; then
        sudo cp "$sf" "$tf"
    fi
    echo "\t\tdiffprog-wrapper .. Done"

    # sf="$HOME/.dotfiles/scripts/bin/uuctl-c"
    # tf="/usr/local/bin/uuctl-c"
    # if [[ ! -f "$tf" || "$sf" -nt "$tf" ]]; then
    #     sudo cp "$sf" "$tf"
    # fi
    # echo "\t\tuuctl-c .. Done"

    sf="$HOME/.dotfiles/scripts/bin/uwla"
    tf="/usr/local/bin/uwla"
    if [[ ! -f "$tf" || "$sf" -nt "$tf" ]]; then
        sudo cp "$sf" "$tf"
    fi
    echo "\t\tuwla .. Done"

    sf="$HOME/.dotfiles/scripts/bin/uwstop"
    tf="/usr/local/bin/uwstop"
    if [[ ! -f "$tf" || "$sf" -nt "$tf" ]]; then
        sudo cp "$sf" "$tf"
    fi
    echo "\t\tuwstop .. Done"
}

# Alacritty themes here: https://github.com/alacritty/alacritty-theme

# if [[ $IS_CONF -eq 1 && $IS_UWSM -eq 1 ]]; then
#     rm "$CONFIG_DIR/hypr/hyprland.conf"
#     ln -s "$HOME/.dotfiles/config/hypr/hyprland_uwsm.conf" "$CONFIG_DIR/hypr/hyprland.conf"
#     hyprctl reload
# elif [[ $IS_CONF -eq 1 ]]; then
#     rm "$CONFIG_DIR/hypr/hyprland.conf"
#     ln -s "$HOME/.dotfiles/config/hypr/hyprland_standalone.conf" "$CONFIG_DIR/hypr/hyprland.conf"
#     hyprctl reload
# fi

cd "$CWD"

echo "Done"
echo "-------------------------"

