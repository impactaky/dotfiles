#!/bin/bash -eu

pushd $HOME
LANG=C xdg-user-dirs-update --force
rm -r ./[!a-zA-Z]*
popd
