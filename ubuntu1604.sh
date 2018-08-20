#!/bin/bash -eu

pushd $HOME
LANG=C xdg-user-dirs-update --force
rm -r ./[!a-zA-Z]*
popd

export DIR_DIR=$HOME/dotfiles

sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt install -y \
	neovim python3 python3-pip \
	tmux xmonad dmenu \
	libudev-dev libusb-1.0-0-dev libboost-dev libboost-regex-dev \
	porg golang zsh gawk curl trash-cli automake
sudo pip3 install neovim
sudo pip3 install xonsh pexpect

./font/setup.sh
./vim/setup.sh
./tmux/setup.sh
./mayu/setup.sh
./xmonad/setup.sh
./zsh/setup.sh
./gnome-terminal/setup.sh
./global/setup.sh
