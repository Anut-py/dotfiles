#!/bin/zsh
# Use this script to set up the shell (call from .zshrc)

BASE_DIR=/c/Anand # Windows
# BASE_DIR=~ # Linux

export XDG_BIN_HOME=$BASE_DIR/.local/bin
export XDG_CACHE_HOME=$BASE_DIR/.cache
export XDG_CONFIG_HOME=$BASE_DIR/.config
export XDG_DATA_HOME=$BASE_DIR/.local/share
export XDG_RUNTIME_DIR=$BASE_DIR/.tmp
export XDG_STATE_HOME=$BASE_DIR/.local/state

export TMPDIR=$XDG_RUNTIME_DIR

export PATH=$PATH:$XDG_BIN_HOME

bindkey -v

