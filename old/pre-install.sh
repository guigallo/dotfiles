# dependencies

echo '[INSTALLING]: git, stow, fzf, the_silver_searcher, tmux, zsh'
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
       # linux
       sudo pacman -Sy git fzf stow python3 the_silver_searcher tmux zsh ripgrep fd
elif [[ "$OSTYPE" == "darwin"* ]]; then
       # Mac OSX
       brew update
       brew install git stow fzf the_silver_searcher tmux zsh ripgrep fd
       brew install --build-from-source python3
else
       echo 'invalid system'
       exit 1;
fi

echo '[INSTALLING]: volta'
curl https://get.volta.sh | bash
echo '[SOURCE]: .profile'
source $HOME/.profile

volta install node npm yarn

echo '[INSTALLING]: npm dependencies'
yarn global add neovim typescript typescript-language-server diagnostic-languageserver bash-language-server

echo '[INSTALLING]: neovim plug'
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim --headless +PlugInstall +qa

echo '[Change shell]: zsh'
chsh -s $(which zsh)

echo '[INSTALLING]: oh-my-zsh'
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
