#!/bin/bash -eu

sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install -y \
	git neovim python3 python3-pip \
	tmux libudev-dev libusb-1.0-0-dev libboost-dev libboost-regex-dev \
	porg golang zsh gawk curl trash-cli automake ninja-build ccache
sudo pip3 install -U pip
sudo pip3 install cmake
sudo pip3 install pynvim
sudo pip3 install xonsh pexpect python-language-server

wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
echo deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-9 main \
   | sudo tee -a /etc/apt/sources.list
echo deb-src http://apt.llvm.org/bionic/ llvm-toolchain-bionic-9 main \
   | sudo tee -a /etc/apt/sources.list
sudo apt update
sudo apt install clang-12 clang-format-12 clang-tidy-12 clang-tools-12 clangd-12 \
    libclang-12-dev lld-12
