set -e

# Change shell to zsh
chsh -s $(which zsh)

echo -n "Symlinking dotfiles..."
#Symlink .zshrc and .vimrc
ln -s $HOME/.dotfiles/vim/vimrc $HOME/.vimrc
mkdir $HOME/.vim/
ln -s $HOME/.dotfiles/vim/plugin $HOME/.vim/plugin
ln -s $HOME/.dotfiles/zsh/zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/git/gitconfig $HOME/.gitconfig
ln -s $HOME/.dotfiles/gemrc $HOME/.gemrc
ln -s $HOME/.dotfiles/javascript/jshintrc $HOME/.jshintrc
ln -s $HOME/.dotfiles/ruby/rubocop.yml $HOME/.rubocop.yml
echo 'done!'

# Install Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +q

# Brew specific installs
brew install the_silver_searcher
brew install autojump
brew install git

brew install macvim --with-cscope --with-lua
brew linkapps macvim

gem install hub
gem install rubocop-git

git clone git://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.dotfiles/zsh-syntax-highlighting
git clone git://github.com/zsh-users/zsh-autosuggestions $HOME/.dotfiles/zsh-autosuggestions

brew install node
npm install -g jshint

echo "# Add machine-specific config here (this file and the local directory will be ignored by git)" > $HOME/.dotfiles/local/zshrc

echo "Done installing! You can customize your local zsh config by editing ~/.dotfiles/local/zshrc"
