#!/bin/bash

DOT_DIR=${DOT_DIR:-$HOME/dotfiles}

ln -sf "${DOT_DIR}/cursor/keybindings.json" "/Users/impactaky/Library/Application Support/Cursor/User/keybindings.json"
ln -sf "${DOT_DIR}/cursor/settings.json" "/Users/impactaky/Library/Application Support/Cursor/User/settings.json"

# install extensions
for ext in $(cat "${DOT_DIR}/cursor/extensions.txt"); do
    cursor --install-extension $ext
done
