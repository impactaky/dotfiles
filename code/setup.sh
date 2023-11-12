#!/bin/bash

set -eux

while IFS= read -r line; do
    code --install-extension $line
done < $HOME/dotfiles/code/extensions
