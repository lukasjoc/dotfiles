#!/bin/sh

# restore background using nitrogen
nitrogen --restore &

# run the compositor
picom &

# run QTile with custom settings
exec qtile start -c "$HOME/.config/qtile/config.py"

