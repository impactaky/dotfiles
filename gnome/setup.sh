#!/bin/zsh

DOT_DIR=${DOT_DIR:-$HOME/dotfiles}

dconf load / <$DOT_DIR/gnome/user.conf
