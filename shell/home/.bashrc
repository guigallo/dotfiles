#!/bin/bash

# echo '[.bashrc]'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# profile
source "$HOME/dotfiles/shell/index.sh"

# zsh
exec zsh
