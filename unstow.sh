#!/bin/zsh

pushd stow
stow --verbose --delete --target="$HOME" home
stow --verbose --delete --target="$HOME" zsh
stow --verbose --delete --target="$XDG_CONFIG_HOME" config
popd
