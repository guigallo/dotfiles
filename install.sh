#!/bin/zsh

if [[ -z $STOW_FOLDERS ]]; then
  STOW_FOLDERS="bash,dunst,git,i3,npm,nvim,ranger,rofi,Xresources,zsh,tmux,alacritty,polybar,picom"
fi

if [[ -z $DOTFILES ]]; then
  DOTFILES=$HOME/git/dotfiles
fi
echo $foldern

pushd $DOTFILES
for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
  stow --adopt -Svt ~ $folder
done
popd

source ~/.zshrc

echo 'installing zsh dependencies'
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/supercrabtree/k $ZSH_CUSTOM/plugins/k
