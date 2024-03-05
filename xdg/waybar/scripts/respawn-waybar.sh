#!/bin/bash

CONFIG_FILES="$XDG_CONFIG_HOME/waybar/config.jsonc $XDG_CONFIG_HOME/waybar/style.css $XDG_CONFIG_HOME/waybar/scripts/*"

killall waybar

trap "killall waybar" EXIT

while true; do
	waybar &
	# waybar -l debug &
	# GTK_DEBUG=interactive waybar -l debug &
	inotifywait -e create,modify $CONFIG_FILES
	killall waybar
done
