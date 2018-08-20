#!/bin/sh

curl https://sh.rustup.rs -sSf | sh
rustup install nightly
rustup override set nightly
cargo install rustfmt
cargo install racer
cargo install xargo
mkdir ~/.rust
cd ~/.rust
git clone --depth=1 https://github.com/rust-lang/rust.git

