#!/bin/sh
# foot --server &
NetworkManager &
syncthing &
# waybar &
noctalia-shell &
# /run/current-system/sw/bin/soteria
hyprpolkitagent &
gnome-keyring-daemon --start --components=secrets

exec dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots
