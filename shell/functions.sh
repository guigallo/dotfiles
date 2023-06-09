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
