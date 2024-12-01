#!/bin/sh

SCRIPT_DIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd)"
export DOTFILES="$SCRIPT_DIR"
"$DOTFILES/result/bin/nu" --config "$DOTFILES/config/nushell/config.nu" --env-config "$DOTFILES/config/nushell/env.nu"