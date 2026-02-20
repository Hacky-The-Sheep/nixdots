noctalia-shell &
# waybar &
/run/current-system/sw/bin/soteria &
# swww-daemon &
syncthing &
# dunst &
NetworkManager &
gnome-keyring-daemon --start --components=secrets &
dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
