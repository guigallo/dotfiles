#!/bin/bash

# echo '[alias.sh]'

alias n=nvim
alias t=tmux
alias ..="cd .."
alias vim="nvim"
alias vi="nvim"
alias oldvim="/usr/bin/vim"
# alias ll='ls -alhF'
# alias la='ls -A'
# alias l='ls -CF'
alias cdroot='cd $(git root)'
alias td='todo.sh'

# list files
alias oldls='/usr/bin/ls'
alias ka='k -Ah'
alias ls='ls -lhF'
alias l='ls -la'
alias ll='exa --long'

# colors
alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'

# tree
alias t2='tree -a -L 2'
alias t3='tree -a -L 3'

# others
alias yarnold="$(which yarn)"
alias yarnglobal="$(which yarn) global --user-yarnrc $XDG_CONFIG_HOME/yarn/config"
alias yarn="yarn --user-yarnrc $XDG_CONFIG_HOME/yarn/config"
