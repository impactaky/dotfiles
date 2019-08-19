#!/bin/bash -eu

sudo apt update
sudo apt install -y \
	git neovim python3 python3-pip \
	tmux libudev-dev libusb-1.0-0-dev libboost-dev libboost-regex-dev \
	porg golang zsh gawk curl trash-cli automake 
sudo pip3 install neovim
sudo pip3 install xonsh pexpect

sudo apt install clang-8 clang-format-8 clang-tidy-8 \
    libclang-8-dev lld-8 lldb-8 llvm-8-dev ninja-build
