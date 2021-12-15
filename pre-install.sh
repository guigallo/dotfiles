# dependencies
sudo pacman -Sy fzf stow python3 the_silver_searcher

# nodeenv
yay -Sy nvm
source /usr/share/nvm/init-nvm.sh
nvm install --lts
npm install -g yarn neovim

# neovim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
