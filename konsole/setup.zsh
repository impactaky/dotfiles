#!/bin/zsh -eu

DOT_DIR=${DOT_DIR:-$HOME/dotfiles}
KONSOLE_DOT_DIR=${KONSOLE_DOT_DIR:-$HOME/.local/share/konsole}
mkdir -p $KONSOLE_DOT_DIR
ln -s $DOT_DIR/konsole/Profile\ 1.profile $KONSOLE_DOT_DIR/Profile\ 1.profile
ln -s $DOT_DIR/konsole/tommorow_night.colorscheme $KONSOLE_DOT_DIR/tommorow_night.colorscheme
