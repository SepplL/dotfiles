#!/bin/bash

waybar -c ~/.config/waybar/config-mango >/dev/null 2>&1 &

swayidle -w \
	timeout 300 'swaylock -i ~/wallpaper/blockwavedawn.png' \
	timeout 600 'dunstify output off' \
	resume 'dunstify output resumed' \
	before-sleep 'swaylock -i ~/wallpaper/blockwavedawn.png' >/dev/null 2>&1 &

# swaybg
[[ -e ~/wallpaper/dracula-soft-waves-44475a.png ]] && swaybg -m fill -i ~/wallpaper/leafy-dawn.png >/dev/null 2>&1 &

dunst >/dev/null 2>&1 &

