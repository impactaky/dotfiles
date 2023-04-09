#!/bin/bash

set -eux

CLANG_VERSION=15
IS_SERVER=${IS_SERVER:-no}

sudo add-apt-repository ppa:neovim-ppa/unstable
sudo sh -c "wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -"
sudo sh -c 'echo "deb http://apt.llvm.org/$(lsb_release -sc)/ llvm-toolchain-$(lsb_release -sc)-15 main" >> /etc/apt/sources.list'
sudo apt update
sudo apt install -y \
	git neovim python3 python3-pip \
	tmux porg golang zsh gawk curl trash-cli automake ninja-build ccache \
    clang-"${CLANG_VERSION}" \
    clang-format-"${CLANG_VERSION}" \
    clang-tidy-"${CLANG_VERSION}" \
    clang-tools-"${CLANG_VERSION}" \
    clangd-"${CLANG_VERSION}" \
    libclang-"${CLANG_VERSION}"-dev \
    lld-"${CLANG_VERSION}"

sudo pip3 install -U pip
sudo pip3 install cmake
sudo pip3 install pynvim
sudo pip3 install pexpect python-language-server


curl -fsSL https://deno.land/x/install/install.sh | sh

if [[ "${IS_SERVER}" != "no" ]]; then
    sudo apt install -y \
        libudev-dev libusb-1.0-0-dev libboost-dev libboost-regex-dev
fi
