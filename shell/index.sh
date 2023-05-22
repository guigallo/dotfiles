#!/bin/bash

echo '[index.sh]'

source ./alias.sh
source ./env.sh
source ./dev.sh
source ./theme.sh

if [ -n "$DOTFILES_INSTALLING" ] && [ "$DOTFILES_INSTALLING" = true ]; then
	# installing only
	unset DOTFILES_INSTALLING
	unset TMUX_TPM_PATH
	# else
	# [ -z "$TMUX" ] && { tmux attach || exec tmux new-session && exit; }
fi
