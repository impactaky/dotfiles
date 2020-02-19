#!/bin/zsh

DOT_DIR=${DOT_DIR:-$HOME/dotfiles}

dconf load / <$DOT_DIR/gnome/user.conf
gsettings set org.gnome.desktop.wm.keybindings cycle-windows "['<Super>j']"
gsettings set org.gnome.desktop.wm.keybindings cycle-windows-backward "['<Super>k']"
gsettings set org.gnome.desktop.wm.preferences focus-mode 'sloppy'
