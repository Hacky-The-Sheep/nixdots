#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

# Find all image files (adjust extensions if needed)
mapfile -t WALLPAPERS < <(find "$WALLPAPER_DIR" -type f \( \
  -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \
\))

# Exit if no wallpapers are found
if [ "${#WALLPAPERS[@]}" -eq 0 ]; then
  echo "No wallpapers found in $WALLPAPER_DIR"
  exit 1
fi

# Pick a random wallpaper
RANDOM_WALLPAPER="${WALLPAPERS[RANDOM % ${#WALLPAPERS[@]}]}"

# Set wallpaper with swww
swww img "$RANDOM_WALLPAPER" \
  --transition-type any \
  --transition-fps 60 \
  --transition-duration 1
