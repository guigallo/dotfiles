#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ps1
PS1='[\u@\h \W]\$ '

# profile
source ~/.profile

echo '[.bashrc] loaded'

# zsh
exec zsh

