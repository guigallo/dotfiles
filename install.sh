#!/bin/bash

Green='\033[0;32m'
Color_Off='\033[0m'

export DOTFILES_INSTALLING=true

source "$HOME/dotfiles/shell/env.sh"

pushd shell || exit
echo -e "[${Green}STOWING_DOTFILES${Color_Off}]"
stow --verbose --target="$HOME" home
popd || exit

echo -e "[${Green}STOWING_XDG_CONFIG${Color_Off}]"
stow --verbose --target="$XDG_CONFIG_HOME" xdg

echo -e "[${Green}UPDATING_SYSTEM${Color_Off}]"
sudo pacman -Syu

dependencies=(
	"git"
	"stow"
	"tmux"
	"zsh"
	"tldr"
	"fzf"
	"fd"
	"ttf-jetbrains-mono-nerd"
)
dependencies_names="${dependencies[*]}"
echo -e "[${Green}INSTALLING_DEPENDENCIES${Color_Off}]: $dependencies_names"
sudo pacman -Sy "$dependencies_names"

TMUX_TPM_PATH=$XDG_CONFIG_HOME/tmux_tpm
echo -e "[${Green}DOWNLOAD_TMUX_DEPENDENCIES${Color_Off}]: $TMUX_TPM_PATH"
git clone --depth=1 https://github.com/tmux-plugins/tpm "$TMUX_TPM_PATH"
"$TMUX_TPM_PATH"/scripts/install_plugins.sh

if ! command -v nvm &>/dev/null; then
	echo -e "[${Green}INSTALLING_DEPENDENCIES${Color_Off}]: nvm"
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
	nvm install --lts
	nvm use --lts
	npm install --global yarn
else
	echo -e "[${Green}DEPENDENCIES_INSTALLED${Color_Off}]: nvm"
fi

git clone --depth=1 https://github.com/AstroNvim/AstroNvim "$XDG_CONFIG_HOME"/nvim
nvim --headless -c 'quitall'

# this always should be at the bottom because install script open new shell
OMZ_PATH=$XDG_CONFIG_HOME/.oh-my-zsh
if ! omz -v omz &>/dev/null; then
	echo -e "[${Green}INSTALLING_DEPENDENCIES${Color_Off}]: on-my-zsh"
	rm -rf "$OMZ_PATH"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
	echo -e "[${Green}DEPENDENCIES_ALREADY_INSTALLED${Color_Off}]: on-my-zsh"
fi

ZSH_PLUGINS_PATH=$OMZ_PATH/custom/plugins
mkdir -p "$ZSH_PLUGINS_PATH"
echo -e "[${Green}DOWNLOAD_ZSH_DEPENDENCIES${Color_Off}]: ${ZSH_PLUGINS_PATH}"
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions "$ZSH_PLUGINS_PATH"/zsh-autosuggestions
git clone --depth=1 https://github.com/MichaelAquilina/zsh-you-should-use.git "$ZSH_PLUGINS_PATH"/zsh-you-should-use
git clone --depth=1 https://github.com/jeffreytse/zsh-vi-mode "$ZSH_PLUGINS_PATH"/zsh-vi-mode
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_PLUGINS_PATH"/powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$OMZ_PATH/custom/themes/powerlevel10k"

mkdir -p "$XDG_CONFIG_HOME"/zsh
rm "$XDG_CONFIG_HOME"/zsh/.zshrc
pushd shell || exit
echo -e "[${Green}STOWING_ZSHRC${Color_Off}]"
stow --verbose --target="$XDG_CONFIG_HOME"/zsh zsh
popd || exit

pkill -USR1 kitty
zsh
