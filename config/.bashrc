#!/bin/bash

bind -x '"\C-l": clear'

# homebrew no auto update
if command -v brew 2&>/dev/null; then
  export HOMEBREW_NO_AUTO_UPDATE=1;
fi

[[ -f "$HOME/private" ]]; source "$HOME/private"
source "$HOME/.local/bin/minienv/minienv"

PATH="$PATH:$HOME/.local/bin/scripts"
eval "$(/opt/homebrew/bin/brew shellenv)"

PATH="/opt/homebrew/opt/curl/bin:$PATH"


# Rust
export RUST_SRC_PATH="$HOME/.cargo"
export RUSTBIN="$HOME/.cargo/bin"
PATH=$RUST_SRC_PATH/bin:$PATH

# Go and GoMods
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export GO111MODULE=on
PATH=$GOBIN:$PATH

export PATH
