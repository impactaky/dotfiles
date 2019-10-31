#!/bin/bash -eu

sudo apt update
sudo apt install -y \
	git neovim python3 python3-pip \
	tmux libudev-dev libusb-1.0-0-dev libboost-dev libboost-regex-dev \
	porg golang zsh gawk curl trash-cli automake ninja-build ccache
sudo pip3 install -U pip
sudo pip3 install cmake
sudo pip3 install pynvim
sudo pip3 install xonsh pexpect

wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
echo deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-9 main \
   | sudo tee -a /etc/apt/sources.list
echo deb-src http://apt.llvm.org/bionic/ llvm-toolchain-bionic-9 main \
   | sudo tee -a /etc/apt/sources.list
sudo apt update
sudo apt install clang-9 clang-format-9 clang-tidy-9 clang-tools-9 clangd-9 \
    libclang-9-dev lld-9 
