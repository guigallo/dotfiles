#!/bin/zsh

BACKUP_DOTENVS=".Xresources,.bash_profile,.bashrc,.config/dunst/dunstrc,.gitconfig,.config/i3/config,.npmrc,.config/nvim/init/vim,.config/ranger/colorschemes,.config/rofi/config,.zshrc"
BACKUP_FOLDER=$HOME/.dotfiles.backup

mkdir -pv $BACKUP_FOLDER

for folder in $(echo $BACKUP_DOTENVS | sed "s/,/ /g")
do
  cp $HOME/$folder $BACKUP_FOLDER 
done
