## Instructions for getting everything set up.

### Vim Plugins: Plug
* https://github.com/junegunn/vim-plug
* curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
* :source ~/.vimrc
* Launch vim and run :PlugInstall

### Homebrew Install
* https://brew.sh
* /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

### rbenv install
* https://github.com/rbenv/rbenv
* brew install rbenv
* rbenv install <ruby version>
* rbenv local/global <ruby version>

### fzf install
* https://github.com/junegunn/fzf
* brew install fzf

### oh-my-zsh
* https://ohmyz.sh
* sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

### Installing The Silver Searcher for file system searching
* brew install the_silver_searcher
* There is a section in .vimrc ("if executable('ag')") to integrate with vim.

### tmux
* brew install tmux

#### Installing tmux with plugins
* brew install reattach-to-user-namespace
##### Plugins:
* https://github.com/tmux-plugins/tpm
* https://github.com/tmux-plugins/tmux-sensible
* https://github.com/tmux-plugins/tmux-yank


