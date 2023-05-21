#!/bin/zsh

source ~/.profile 

pushd stow
stow --verbose --delete --target="$HOME" home
stow --verbose --delete --target="$XDG_CONFIG_HOME" zsh
stow --verbose --delete --target="$XDG_CONFIG_HOME" config
popd
