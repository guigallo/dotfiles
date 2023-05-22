#!/bin/bash

# echo '[index.sh]'

source "$HOME/dotfiles/shell/alias.sh"
source "$HOME/dotfiles/shell/env.sh"
source "$HOME/dotfiles/shell/dev.sh"
source "$HOME/dotfiles/shell/theme.sh"

if [ -n "$DOTFILES_INSTALLING" ] && [ "$DOTFILES_INSTALLING" = true ]; then
	# installing only
	unset DOTFILES_INSTALLING
	unset TMUX_TPM_PATH
	# else
	# [ -z "$TMUX" ] && { tmux attach || exec tmux new-session && exit; }
fi
