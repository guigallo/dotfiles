#!/bin/bash

source ~/.profile

echo "[LINKING_DOTFILES]"
stow --adopt --target="$HOME" to_stow
stow --adopt --target="$XDG_CONFIG_HOME" config

exit 0

echo "[UPDATING_SYSTEM]"
sudo pacman -Syu

dependencies=(
  "git"
  "stow"
  "tmux"
  "zsh"
  "tldr"
  "ttf-jetbrains-mono-nerd"
)
dependencies_names="${dependencies[@]}"
echo "[INSTALLING_DEPENDENCIES]: $dependencies_names"
sudo pacman -Sy $dependencies_names

to_shell=$(which zsh)
echo "[CHANGING_SHELL]: $to_shell"
sudo chsh -s $to_shell

if ! command -v nvm &> /dev/null; then
  echo "[INSTALLING_DEPENDENCIES]: nvm"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
  nvm install --lts
  nvm use --lts
  npm install --global yarn
else
  echo "[DEPENDENCIES_INSTALLED]: nvm"
fi
  nvm install --lts
  nvm use --lts
  npm install --global yarn
  yarn global add typewritten

if ! command -v omz &> /dev/null; then
  echo "[INSTALLING_DEPENDENCIES]: on-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "[DEPENDENCIES_INSTALLED]: on-my-zsh"
fi
