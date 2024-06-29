#!/usr/bin/env bash

DIR="$HOME/.config/dunst"

# Setup before start.
$DIR/scripts/dunstcolors.sh

# Terminate already running dunst instances.
killall -q dunst

# Wait until the processes have been shut down.
while pgrep -u $UID -x dunst >/dev/null; do sleep 1; done

# Launch the dunst.
dunst &
