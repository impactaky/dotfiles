#!/bin/zsh

DOT_DIR=${DOT_DIR:-$HOME/dotfiles}

# zplug
export ZPLUG_HOME=$HOME/.zplug
mkdir -p $HOME/.zplug
git clone https://github.com/zplug/zplug $ZPLUG_HOME
source $ZPLUG_HOME/init.zsh

# zsh
ln -s $DOT_DIR/zsh/.zshrc $HOME/.zshrc
ln -s $DOT_DIR/zsh/.zsh $HOME/.zsh

