#!/bin/sh

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup install nightly
rustup override set nightly
rustup default nightly
rustup component add rust-analyzer-preview
cargo install cargo-edit
