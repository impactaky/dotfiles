#!/bin/sh

if [ $# -gt 0 ]; then
    exec "$@"
else
    SCRIPT_DIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd)"
    . "$SCRIPT_DIR/env.sh"
    exec zsh
fi