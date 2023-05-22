#!/bin/bash

echo '[.alias]'

alias n=nvim
alias t=tmux
alias ..="cd .."
alias vim="nvim"
alias vi="nvim"
alias oldvim="/usr/bin/vim"
# alias ll='ls -alhF'
# alias la='ls -A'
# alias l='ls -CF'
alias oldls='/usr/bin/ls'
alias ls='ls -lhF'
alias l='ls -la'
alias ll='exa --long'
alias cdroot='cd $(git root)'
alias ka='k -Ah'
alias td='todo.sh'

# colors
alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'

# tree
alias t2='tree -a -L 2'
alias t3='tree -a -L 3'

# others
alias i3=startx "$(which i3)"
alias yarn=yarn --user-yarn "$XDG_CONFIG_HOME"/yarn/config
