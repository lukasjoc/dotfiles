#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Try it and love it
set -o vi

# Append to the history file, don't overwrite it
shopt -s histappend

# Update window size after every command
shopt -s checkwinsize

# Save multi-line commands as one command
shopt -s cmdhist

# Setup essential variables
HISTCONTROL=ignoreboth
HISTSIZE=500000
HISTFILESIZE=100000
HISTIGNORE="&:[ ]*:exit:ls:ns:bg:fg:history:clear"
CLICOLOR=1
PROMPT_COMMAND='history -a'
MANWIDTH="92"
EDITOR="vim"
VISUAL="vim"
CDPATH="."
export HISTCONTROL
export HISTSIZE
export HISTFILESIZE
export HISTIGNORE
export CLICOLOR
export PROMPT_COMMAND
export MANWIDTH
export MANPAGER
export EDITOR
export VISUAL
export CDPATH

alias ..="cd ../"
alias ...="cd ../../"
alias ls="ls --author -bcFA --human-readable -N -S --color=auto"
alias ll="ls --full-time"
alias watchdir="watch -d ls --full-time"
alias neofetch="neofetch --stdout"
alias grep="grep --color=auto"
alias watch="watch --color"
alias clear="printf '\e[1;1H\e[2J'"
bin2dec() { echo "obase=10;ibase=2;$1" | bc; }
bin2hex() { echo "obase=10000;ibase=2;$1" | bc; }
dec2bin() { echo "obase=2;$1" | bc; }
XDG_CONFIG_HOME="$HOME/.config"
XDG_CACHE_HOME="$HOME/.cache"
XDG_DATA_HOME="$HOME/.local/share"
XDG_DATA_BIN="$HOME/.local/bin"
MY_SCRIPTS_DIR="$HOME/.local/bin/scripts"

# TODO: Should have add_path/ remove_path tool
PATH="$XDG_DATA_BIN:$PATH"
PATH="/usr/local/bin:$PATH"
PATH="/usr/local/sbin:$PATH"
PATH="$MY_SCRIPTS_DIR:$PATH"
export XDG_CONFIG_HOME
export XDG_CACHE_HOME
export XDG_DATA_HOME
export XDG_DATA_BIND
export MY_SCRIPTS_DIR

# Setup ps1 and git status
PS1="\w# "
PROMPT_COMMAND='PS1="\w $($HOME/.local/bin/scripts/gitstatus-bin)# "'
export PROMPT_COMMAND
export PS1
export PATH

