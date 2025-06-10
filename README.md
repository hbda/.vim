## Requirements

### Packages `ctags`, `the_silver_searcher`
```
brew install ctags the_silver_searcher
```

### Fonts
JetBrains Mono
download and install this font: https://www.jetbrains.com/lp/mono/#how-to-install

## Vim configs installation

Clone this repo into your home directory either as .vim (linux) or vimfiles (windows).
Put this code into your ~/.vimrc along with your personal hacks:

### OSX and Linux
```
source ~/.vim/vimrc
source ~/.vim/gvimrc
```

### Windows
```
source ~/vimfiles/vimrc
source ~/vimfiles/gvimrc
```

### For Neovide (or another neovim)
Documentation https://neovim.io/doc/user/nvim.html#nvim-from-vim
Follow the previous steps. After that:
```bash
mkdir ~/.config/nvim
touch ~/.config/nvim/init.vim
```
Add these contents to the file:
```
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
```
#### Enable python provider
Base on https://peterbabic.dev/blog/install-pynvim-via-homebrew-properly/
Install pynvim:
```bash
mkdir -p ~/.config/nvim/venv
/opt/homebrew/bin/python3 -m venv ~/.config/nvim/venv
source ~/.config/nvim/venv/bin/activate
pip install pynvim

# Leave virtual environment
deactivate
```

Open vim and run `PlugInstall` command.

## Enjoy! :)
