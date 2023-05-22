#!/bin/bash

echo '[env.sh]'

# XGD Base Directory
export XDG_USER=$HOME/xdg
export XDG_CONFIG_HOME=$XDG_USER/config # analogous /etc. default $HOME/.config
export XDG_CACHE_HOME=$XDG_USER/cache   # analogous /var/cache. default $HOME/.cache
export XDG_DATA_HOME=$XDG_USER/data     # analogous /usr/share. default $HOME/.local/share
export XDG_STATE_HOME=$XDG_USER/state   # analogous to /var/lib. default $HOME/.local/state
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority

# Kitty
export KITTY_CONFIG_DIRECTORY="$XDG_CONFIG_HOME/kitty"

# ZSH Plugins config
export YSU_HARDCORE=0
export ZSH_TMUX_AUTOSTART=true
export ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
export ZSH_TMUX_CONFIG=$XDG_CONFIG_HOME/tmux/tmux.conf

export EDITOR='nvim'
export CHROME_EXECUTABLE=google-chrome-stable
export LESS='-R --use-color -Dd+r$Du+b'
export MANPAGER="less -R --use-color -Dd+r -Du+b"
