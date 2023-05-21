#!/bin/bash
export DOTFILES_INSTALLING=true

source ~/dotfiles/stow/home/.profile

pushd stow
echo "[LINKING_DOTFILES]"
stow --verbose --target="$HOME" home
echo "[LINKING_XDG_CONFIG]"
stow --verbose --target="$XDG_CONFIG_HOME" config
popd

echo "[UPDATING_SYSTEM]"
# sudo pacman -Syu

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
dependencies_names="${dependencies[@]}"
echo "[INSTALLING_DEPENDENCIES]: $dependencies_names"
# sudo pacman -Sy $dependencies_names

TMUX_TPM_PATH=$XDG_CONFIG_HOME/tmux_tpm
echo "[DOWNLOAD_TMUX_DEPENDENCIES]: ${TMUX_TPM_PATH}"
git clone https://github.com/tmux-plugins/tpm $TMUX_TPM_PATH
$TMUX_TPM_PATH/scripts/install_plugins.sh

if ! command -v nvm &>/dev/null; then
	echo "[INSTALLING_DEPENDENCIES]: nvm"
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
	nvm install --lts
	nvm use --lts
	npm install --global yarn
else
	echo "[DEPENDENCIES_INSTALLED]: nvm"
fi

git clone --depth 1 https://github.com/AstroNvim/AstroNvim $XDG_CONFIG_HOME/nvim
nvim --headless -c 'quitall'

# this always should be at the bottom because install script open new shell
OMZ_PATH=$XDG_CONFIG_HOME/.oh-my-zsh
if ! omz -v omz &>/dev/null; then
	echo "[INSTALLING_DEPENDENCIES]: on-my-zsh"
	rm -rf $OMZ_PATH
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
	echo "[DEPENDENCIES_ALREADY_INSTALLED]: on-my-zsh"
fi

ZSH_PLUGINS_PATH=$OMZ_PATH/custom/plugins
mkdir -p $ZSH_PLUGINS_PATH
echo "[DOWNLOAD_ZSH_DEPENDENCIES]: ${ZSH_PLUGINS_PATH}"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_PLUGINS_PATH}/zsh-autosuggestions
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_PLUGINS_PATH/zsh-you-should-use
git clone https://github.com/jeffreytse/zsh-vi-mode $ZSH_PLUGINS_PATH/zsh-vi-mode

pushd stow
echo "[LINKING_ZSHRC]"
mkdir -p $XDG_CONFIG_HOME/zsh
rm $XDG_CONFIG_HOME/zsh/.zshrc
stow --verbose --target="$XDG_CONFIG_HOME"/zsh zsh
popd

# pkill -USR1 kitty
# zsh
