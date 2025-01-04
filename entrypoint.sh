#!/bin/sh

SCRIPT_DIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd)"
export DOTFILES="$SCRIPT_DIR"
export XDG_CONFIG_HOME="$DOTFILES/config"
export XDG_CACHE_HOME="$DOTFILES/cache"
# "$DOTFILES/result/bin/nu" --config "$DOTFILES/config/nushell/config.nu" --env-config "$DOTFILES/config/nushell/env.nu"
ZDOTDIR="$DOTFILES/config/zsh" "$DOTFILES/result/bin/zsh"
