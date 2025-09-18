#!/bin/zsh

# Use this script to set up the shell (call from .zshrc)
# Set the BASE_DIR env variable before sourcing

script_dir="$(dirname "$0")"
source $script_dir/env

# History stuff
setopt IGNORE_EOF
setopt APPEND_HISTORY

setopt histignorealldups sharehistory

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Completion
autoload compinit
compinit

eval $(dircolors -b $script_dir/.dircolors)
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

zstyle ':completion:*:warnings' format '%B%F{red}No matches!%f%b'

zstyle ':completion:*:*:*:commands' list-colors '=(#b)(*)=36'
zstyle ':completion:*:*:*:options' list-colors '=(#b)(--*)=35'

# Make C drive completion work on msys2
if [[ -d /c ]] then
    zstyle ':completion:*' fake-files /: '/:c'
fi

# Nicer prompt + git branch
function git_branch() {
  ref=$(git symbolic-ref --short HEAD 2>/dev/null) || return
  echo " %F{magenta}$ref%f"
}

setopt prompt_subst
PROMPT='%F{green}%n %F{blue}%~%f$(git_branch) %# '
RPROMPT='%F{%(?.green.red)}%?  %f%F{yellow}%*%f'

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

# bat as pager
export PAGER="bat -p"
export BAT_PAGER="less -FR"
export MANROFFOPT="-c"
export MANPAGER="sh -c 'col -bx | bat -plman'"

export TMPDIR=$XDG_RUNTIME_DIR

export PATH=$PATH:$XDG_BIN_HOME

export RIPGREP_CONFIG_PATH=$XDG_CONFIG_HOME/ripgreprc

bindkey -v

