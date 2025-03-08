#!/bin/sh

SCRIPT_DIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd)"
. "$SCRIPT_DIR/env.sh"

if [ $# -gt 0 ]; then
    exec "$@"
else
    exec zsh
fi