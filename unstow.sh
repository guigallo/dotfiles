#!/bin/zsh

Green='\033[0;32m'
Color_Off='\033[0m'

source "${HOME}"/dotfiles/shell/env.sh

pushd shell
echo -e "[${Green}UNSTOWING_DOTFILES${Color_Off}]: home"
stow --verbose --delete --target="$HOME" home

echo -e "[${Green}UNSTOWING_DOTFILES${Color_Off}]: zsh"
stow --verbose --delete --target="$XDG_CONFIG_HOME/zsh" zsh
popd

echo -e "[${Green}UNSTOWING_DOTFILES${Color_Off}]: xdg"
stow --verbose --delete --target="$XDG_CONFIG_HOME" xdg
