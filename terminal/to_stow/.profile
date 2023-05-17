# alias
alias n=nvim
alias ..="cd .."
alias vim="nvim"
alias vi="nvim"
alias oldvim="/usr/bin/vim"
# alias ll='ls -alhF'
# alias la='ls -A'
# alias l='ls -CF'
alias oldls='/usr/bin/ls'
alias ls='exa'
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
export LESS='-R --use-color -Dd+r$Du+b'
export MANPAGER="less -R --use-color -Dd+r -Du+b"

# go
# export PATH="$HOME/go/bin:$PATH"

# git
export GITHUB_TOKEN=""
# https://stackoverflow.com/questions/7726949/remove-tracking-branches-no-longer-on-remote
# alias gitcleanbranchs=git fetch -p && for branch in $(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}'); do git branch -D $branch; done

# helpers
function killbyport() {
  kill $(lsof -t -i:$1)
}

# configs
export EDITOR='nvim'

# android
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export ANDROID_AVD_HOME=$HOME/.android/avd

# java
# export JAVA_HOME=/usr/lib/jvm/$(archlinux-java get)
export PATH=$PATH:$JAVA_HOME/bin

# flutter
export CHROME_EXECUTABLE=google-chrome-stable

# keymap
# setxkbmap -model 105 -layout us,us -variant ,intl -option grp:alt_shift_toggle

# bat
export BAT_THEME='Catppuccin-mocha'

# bin path
export PATH="${PATH}:${HOME}/.local/bin"

# Languages
export PATH="${PATH}:${HOME}/.cargo/bin"

# Pluigns
export YSU_HARDCORE=0
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
# source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh
# source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# XGD Base Directory
XDG_USER=$HOME/xdg
export XDG_CONFIG_HOME=$XDG_USER/config # analogous /etc. default $HOME/.config
export XDG_CACHE_HOME=$XDG_USER/cache # analogous /var/cache. default $HOME/.cache
export XDG_DATA_HOME=$XDG_USER/data # analogous /usr/share. default $HOME/.local/share
export XDG_STATE_HOME=$XDG_USER/state # analogous to /var/lib. default $HOME/.local/state

# custom paths
export ZSH="$XDG_CONFIG_HOME/.oh-my-zsh"
export KITTY_CONFIG_DIRECTORY="$XDG_CONFIG_HOME/kitty"

# nvm
export NVM_DIR="$HOME/xdg/config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
