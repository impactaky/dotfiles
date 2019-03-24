#!/bin/bash

DOT_DIR=${DOT_DIR:-$HOME/dotfiles}

mkdir -p ~/.config/systemd/user
cp $DOT_DIR/rtags/rdm.socket ~/.config/systemd/user/
cp $DOT_DIR/rtags/rdm.service ~/.config/systemd/user/

git clone --recursive https://github.com/Andersbakken/rtags.git
cd rtags
mkdir ./build
cd ./build
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ..
make -j$(cat /proc/cpuinfo| grep processor | wc -l)
sudo porg -lp rtags make install

systemctl --user enable rdm.socket
systemctl --user start rdm.socket
