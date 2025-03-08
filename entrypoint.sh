#!/bin/sh

SCRIPT_DIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd)"
. "$SCRIPT_DIR/env.sh"

if [ ! -d "$XDG_CACHE_HOME/dein/repos/github.com/Shougo/dein.vim" ]; then
    echo "Initializing dein.vim..."
    mkdir -p "$XDG_CACHE_HOME/dein/repos/github.com/Shougo"
    git clone https://github.com/Shougo/dein.vim "$XDG_CACHE_HOME/dein/repos/github.com/Shougo/dein.vim"
fi

zsh
