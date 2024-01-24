#!/bin/sh

if [[ $XDG_CURRENT_DESKTOP == "GNOME" ]]; then
	sudo systemctl disable NetworkManager
	sudo systemctl disable gdm
else
	sudo systemctl enable gdm
	sudo systemctl enable NetworkManger
fi

# systemctl enable ly.service
# systemctl disable getty@tty2.service
