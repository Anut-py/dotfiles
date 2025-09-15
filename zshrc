#!/bin/zsh

# Use this script to set up the shell (call from .zshrc)
# Set the BASE_DIR env variable before sourcing

source "$(dirname "$0")"/env

# History stuff
setopt IGNORE_EOF
setopt APPEND_HISTORY

setopt histignorealldups sharehistory

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Next few sections are copied from the msys2 .bashrc
# Interactive operation...
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Default to human readable figures
alias df='df -h'
alias du='du -h'

# Misc :)
alias less='less -r'
alias grep='grep --color'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Some shortcuts for different directory listings
alias ls='ls -hF --color=tty'
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

export TMPDIR=$XDG_RUNTIME_DIR

export PATH=$PATH:$XDG_BIN_HOME

export RIPGREP_CONFIG_PATH=$XDG_CONFIG_HOME/ripgreprc

bindkey -v

