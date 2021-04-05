#!/bin/zsh

DOT_DIR=${DOT_DIR:-$HOME/dotfiles}

# zinit
git clone https://github.com/zdharma/zinit.git $HOME/.zinit/bin

# zsh
ln -s $DOT_DIR/zsh/.zshrc $HOME/.zshrc
ln -s $DOT_DIR/zsh/.zsh $HOME/.zsh
