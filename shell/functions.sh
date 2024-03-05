#!/bin/bash

# echo '[functions.sh]'

function killbyport() {
	kill "$(lsof -t -i:"$1")"
}

function hlbinds() {
	hyprctl binds -j |
		jq -r '(["MODMASK", "KEY", "DISPATCHER", "ARG"]), (.[] | [.modmask, .key, .dispatcher, .arg]) | @tsv' |
		column -t -s $'\t'
}

function hllog() {
	watch -n 0.1 "grep -v \"arranged\" /tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/hyprland.log | tail -n 49"
}

function ya() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
