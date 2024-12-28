#! /bin/sh

notify-send -u low "Udev rule" "Udev rule triggered $(date)"
date > /tmp/UDEV.log
