# alias
alias n=nvim
alias ..="cd .."
alias vim="nvim"
alias vi="nvim"
alias oldvim="/usr/bin/vim"
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'
alias cdroot='cd $(git root)'
alias ka='k -Ah'

# colors
alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
export LESS='-R --use-color -Dd+r$Du+b'
export MANPAGER="less -R --use-color -Dd+r -Du+b"

# volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# go
export PATH="$HOME/go/bin:$PATH"

# git
export GITHUB_TOKEN=""
alias gitlogin='eval "$(ssh-agent -s)" && ssh-add ~/.ssh/github_id_ed25519'
alias gitundolastlocal="git reset HEAD~"
alias gitcleanbranchs='git branch --merged | egrep -v "(^\*|main|master|dev)" | xargs git branch -d'

# helpers
function killbyport() {
  kill $(lsof -t -i:$1)
}

# configs
export EDITOR='nvim'

# broot
source /home/guigallo/.config/broot/launcher/bash/br

# dotfiles
alias dotzsh='n $HOME/.zshrc'
alias dotprofile='n $HOME/.profile'
alias doti3='n $HOME/.config/i3/config'
alias dotvi='n $HOME/.config/nvim/init.vim'

# android
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
export ANDROID_AVD_HOME=$HOME/.android/avd

# keymap
setxkbmap -model 105 -layout us,us -variant ,intl -option grp:alt_shift_toggle

# pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PATH:$PYENV_ROOT/versions/3.9.13/bin

# bat
export BAT_THEME='Nord'

echo '[.profile] loaded'
