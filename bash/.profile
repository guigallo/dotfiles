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
alias l='ls'
alias ll='exa --long'
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
# export VOLTA_HOME="$HOME/.volta"
# export PATH="$VOLTA_HOME/bin:$PATH"

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
export EDITOR='neovide'
export NEOVIDE_MULTIGRID=true

# broot
source /home/guigallo/.config/broot/launcher/bash/br

# dotfiles
alias dotzsh='n $HOME/.zshrc'
alias dotprofile='n $HOME/.profile'
alias doti3='n $HOME/.config/i3/config'
alias dotvi='n $HOME/.config/nvim/init.vim'

# android
# export ANDROID_HOME=/opt/android-sdk
# export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export ANDROID_HOME=$HOME/Android/Sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export ANDROID_AVD_HOME=$HOME/.android/avd

# flutter
export CHROME_EXECUTABLE=google-chrome-stable

# keymap
setxkbmap -model 105 -layout us,us -variant ,intl -option grp:alt_shift_toggle

# pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PATH:$PYENV_ROOT/versions/3.9.13/bin

# bat
export BAT_THEME='Catppuccin-mocha'

# sonar
export SONAR_SCANNER_HOME="/opt/sonar-scanner"
export PATH="${SONAR_SCANNER_HOME}/bin:${PATH}"

# bin path
export PATH="${PATH}:${HOME}/.local/bin"

# rust
export PATH="${PATH}:${HOME}/.cargo/bin"

# Docker
# export DOCKER_HOST=$(docker context inspect --format '{{.Endpoints.docker.Host}}')
# export UID=$(id -u)
# export GID=$(id -g)

# Alias helpers
export YSU_HARDCORE=0

# Pluigns
source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh

ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
