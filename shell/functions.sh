#!/bin/bash

echo '[functions.sh]'

function killbyport() {
	kill "$(lsof -t -i:"$1")"
}
