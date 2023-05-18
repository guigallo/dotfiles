#!/bin/bash

source ~/dotfiles/terminal/home/.profile

echo "[LINKING_DOTFILES]"
stow --verbose --adopt --target="$HOME" home
echo "[LINKING_XDG_CONFIG]"
stow --verbose --adopt --target="$XDG_CONFIG_HOME" config

exit 0
echo "[UPDATING_SYSTEM]"
sudo pacman -Syu

dependencies=(
	"git"
	"stow"
	"tmux"
	"zsh"
	"tldr"
	"ttf-jetbrains-mono-nerd"
)
dependencies_names="${dependencies[@]}"
echo "[INSTALLING_DEPENDENCIES]: $dependencies_names"
sudo pacman -Sy $dependencies_names

ZSH_PLUGINS_PATH=$XDG_CONFIG_HOME/.oh-my-zsh/custom/plugins
echo "[DOWNLOAD_GIT_DEPENDENCIES]: ${ZSH_PLUGINS_PATH}"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_PLUGINS_PATH}/zsh-autosuggestions
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_PLUGINS_PATH/zsh-you-should-use
git clone https://github.com/jeffreytse/zsh-vi-mode $ZSH_PLUGINS_PATH/zsh-vi-mode

to_shell=$(which zsh)
echo "[CHANGING_SHELL]: $to_shell"
sudo chsh -s $to_shell

if ! command -v nvm &>/dev/null; then
	echo "[INSTALLING_DEPENDENCIES]: nvm"
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
	nvm install --lts
	nvm use --lts
	npm install --global yarn
	yarn global add typewritten
else
	echo "[DEPENDENCIES_INSTALLED]: nvm"
fi

git clone --depth 1 https://github.com/AstroNvim/AstroNvim $XDG_CONFIG_HOME/nvim
nvim --headless -c 'quitall'

# this always should be at the bottom because install script open new shell
if ! command -v omz &>/dev/null; then
	echo "[INSTALLING_DEPENDENCIES]: on-my-zsh"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
	echo "[DEPENDENCIES_INSTALLED]: on-my-zsh"
fi
