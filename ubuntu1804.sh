#!/bin/bash -eu

sudo apt update
sudo apt install -y \
	git neovim python3 python3-pip \
	tmux xmonad dmenu \
	libudev-dev libusb-1.0-0-dev libboost-dev libboost-regex-dev \
	porg golang zsh gawk curl trash-cli automake fcitx-mozc
sudo pip3 install neovim
sudo pip3 install xonsh pexpect
