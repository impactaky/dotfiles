#!/bin/zsh

set -eux

# install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/impactaky/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

brew install \
    coreutils \
    findutils \
    gawk \
    gh \
    git \
    gnu-getopt \
    gnu-indent \
    gnu-sed \
    gnu-tar \
    gnutls \
    google-chrome \
    google-japanese-ime \
    grep \
    iterm2 \
    karabinar-elements \
    koekeishiya/formulae/yabai \
    neovim \
    sed \
    tmux \
    trash \
    wget \
    zsh-completions

echo PATH=\"/opt/homebrew/opt/libtool/libexec/gnubin/:\${PATH}\" >> ${HOME}/.zsh/local.zshrc
echo PATH=\"/opt/homebrew/opt/coreutils/libexec/gnubin/:\${PATH}\" >> ${HOME}/.zsh/local.zshrc
echo PATH=\"/opt/homebrew/opt/gnu-indent/libexec/gnubin/:\${PATH}\" >> ${HOME}/.zsh/local.zshrc
echo PATH=\"/opt/homebrew/opt/gnu-tar/libexec/gnubin/:\${PATH}\" >> ${HOME}/.zsh/local.zshrc
echo PATH=\"/opt/homebrew/opt/grep/libexec/gnubin/:\${PATH}\" >> ${HOME}/.zsh/local.zshrc
echo PATH=\"/opt/homebrew/opt/gnu-sed/libexec/gnubin/:\${PATH}\" >> ${HOME}/.zsh/local.zshrc
echo PATH=\"/opt/homebrew/opt/gawk/libexec/gnubin/:\${PATH}\" >> ${HOME}/.zsh/local.zshrc
echo PATH=\"/opt/homebrew/opt/findutils/libexec/gnubin/:\${PATH}\" >> ${HOME}/.zsh/local.zshrc
