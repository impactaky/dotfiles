#!/bin/sh

SCRIPT_DIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd)"
export DOTFILES="$SCRIPT_DIR"

# Common settings
export XDG_CONFIG_HOME="$DOTFILES/config"
export XDG_CACHE_HOME="$DOTFILES/cache"
export XDG_DATA_HOME="$DOTFILES/share"
export XDG_STATE_HOME="$DOTFILES/state"
export PATH="$DOTFILES/result/bin:$PATH"

# starship
export STARSHIP_CONFIG="$XDG_CONFIG_HOME"/starship.toml
export STARSHIP_CACHE="$XDG_CACHE_HOME"/starship

# zsh
export ZDOTDIR="$DOTFILES/config/zsh"
