#!/bin/sh

if uwsm check may-start; then
	exec systemd-cat -t uwsm_start uwsm start Hyprland
fi
