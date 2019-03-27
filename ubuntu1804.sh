#!/bin/bash -eu

sudo apt update
sudo apt install -y \
	git neovim python3 python3-pip \
	tmux libudev-dev libusb-1.0-0-dev libboost-dev libboost-regex-dev \
	porg golang zsh gawk curl trash-cli automake 
sudo pip3 install neovim
sudo pip3 install xonsh pexpect

sudo apt install clang-7 clang-format-7 clang-tidy-7 \
    libclang-7-dev lld-7 lldb-7 llvm-7-dev ninja-build
