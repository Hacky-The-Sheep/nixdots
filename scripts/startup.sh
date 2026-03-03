#!/bin/sh
# foot --server &
NetworkManager &
syncthing &
# waybar &
noctalia-shell &
# qs &
# /usr/lib/soteria-polkit/soteria &
/run/current-system/sw/bin/soteria
# swaybg -i /home/hacky/Pictures/Wallpapers/pixel_road.png &
gnome-keyring-daemon --start --components=secrets

exec dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots
