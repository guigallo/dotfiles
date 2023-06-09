#!/bin/bash

# echo '[index.sh]'

DOTFILES_PATH="$HOME/dotfiles"

source "$DOTFILES_PATH/shell/alias.sh"
source "$DOTFILES_PATH/shell/env.sh"
source "$DOTFILES_PATH/shell/dev.sh"
source "$DOTFILES_PATH/shell/theme.sh"
source "$DOTFILES_PATH/shell/functions.sh"

export PATH="$PATH:$DOTFILES_PATH/shell/bin"

if [ -n "$DOTFILES_INSTALLING" ] && [ "$DOTFILES_INSTALLING" = true ]; then
	# installing only
	unset DOTFILES_INSTALLING
	unset TMUX_TPM_PATH
	# else
	# [ -z "$TMUX" ] && { tmux attach || exec tmux new-session && exit; }
fi
