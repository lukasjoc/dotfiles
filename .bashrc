#!/bin/bash
set -o vi

# https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
shopt -s cdspell dirspell
shopt -s checkhash
shopt -s failglob
shopt -u hostcomplete
shopt -s cmdhist
shopt -s histappend

export HISTCONTROL=ignoreboth
export MANWIDTH="92"
export PAGER="more"
export EDITOR="vim"
export VISUAL="vim"
export CC="clang"
export CXX="clang"
export PS1="\w# "
export PROMPT_COMMAND='PS1="\w $($HOME/.local/scripts/gitstatus-bin)# "'

alias ..="cd ../"
alias ls="ls --author -bcFA --human-readable -N -S --color=auto"
alias ll="ls -ls"
alias grep="grep --color=auto"
alias watch="watch --color"
alias clear="printf '\e[1;1H\e[2J'"

bin2dec() { echo "obase=10;ibase=2;$1" | bc; }
bin2hex() { echo "obase=10000;ibase=2;$1" | bc; }
dec2bin() { echo "obase=2;$1" | bc; }

# overwrites path to $PATH checking if path is in $PATH before doing so.
pathadd() {
    [[ ! "${PATH//:/ }" =~ "$1" && -d  $1 ]] \
    && export PATH="$1:$PATH"
}

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DATA_BIN="$HOME/.local/bin"
pathadd $XDG_DATA_BIN

export SCRIPTSPATH="$HOME/.local/scripts"
export SCRIPTSINST="$HOME/.local/scripts/debian"
. "$HOME/.local/scripts/env"
pathadd $SCRIPTSPATH
pathadd $SCRIPTSINST

export GOPATH="$HOME/.local/go"
export GOBIN="$HOME/.local/go/bin"
export CGO_ENABLED=0
pathadd $GOBIN

source ~/perl5/perlbrew/etc/bashrc
. "$HOME/.cargo/env"

