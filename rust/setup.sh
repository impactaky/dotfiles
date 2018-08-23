#!/bin/sh

curl https://sh.rustup.rs -sSf | sh
rustup install nightly
rustup override set nightly
rustup default nightly
rustup component add rustfmt-preview
rustup component add rls-preview rust-analysis rust-src
cargo install racer
cargo install xargo

