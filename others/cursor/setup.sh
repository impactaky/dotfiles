#!/bin/bash

ln -sf "$DOTFILES/others/cursor/keybindings.json" "/Users/impactaky/Library/Application Support/Cursor/User/keybindings.json"
ln -sf "$DOTFILES/others/cursor/settings.json" "/Users/impactaky/Library/Application Support/Cursor/User/settings.json"

# install extensions
for ext in $(cat "$DOTFILES/others/cursor/extensions.txt"); do
    cursor --install-extension $ext
done
