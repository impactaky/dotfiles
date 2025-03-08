#!/bin/sh

SCRIPT_DIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd)"
export DOTFILES="$SCRIPT_DIR"

PATH_ID=$(echo "$DOTFILES" | tr '/:' '__')
export XDG_CONFIG_HOME="$DOTFILES/config"
export XDG_CACHE_HOME="$DOTFILES/cache/${PATH_ID}"
export XDG_DATA_HOME="$DOTFILES/share/${PATH_ID}"
export XDG_STATE_HOME="$DOTFILES/state/${PATH_ID}"
export PATH="$DOTFILES/result/bin:$PATH"

mkdir -p "$XDG_CACHE_HOME"
mkdir -p "$XDG_DATA_HOME"
mkdir -p "$XDG_STATE_HOME"

# starship
export STARSHIP_CONFIG="$XDG_CONFIG_HOME"/starship.toml
export STARSHIP_CACHE="$XDG_CACHE_HOME"/starship

# zsh
export ZDOTDIR="$DOTFILES/config/zsh"
