#!/bin/bash

# Setup Language Support

# Rust
RUST_SRC_PATH="$HOME/.cargo"
RUSTBIN="$HOME/.cargo/bin"
PATH="$RUST_SRC_PATH/bin:$PATH"

# Go
GOPATH="$HOME/go"
GOBIN="$GOPATH/bin"
GO111MODULE=on
PATH="$GOBIN:$PATH"

# Node & NVM
NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ]; \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ]; \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Custom Environment, Scripts, and more
source "$HOME/.local/bin/minienv/minienv"
PATH="$PATH:$HOME/.local/bin/scripts"
PATH="$PATH:$HOME/.local/bin/cooldocker"
PATH="/opt/homebrew/opt/curl/bin:$PATH"
[[ -f "$HOME/private" ]]; source "$HOME/private"

# What is this ???
# eval "$(/opt/homebrew/bin/brew shellenv)"

# this is not in my environment config, because on linux this wont work reliably
bind -x '"\C-l": clear'

export \
    GOPATH \
    GOBIN \
    GO111MODULE \
    VISUAL \
    RUST_SRC_PATH \
    RUSTBIN \
    NVM_DIR \
    PATH
