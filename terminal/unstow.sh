#!/bin/zsh

# stow -Dvt ~ $folder
stow --verbose --delete --target="$HOME" home
stow --verbose --delete --target="$XDG_CONFIG_HOME" config
