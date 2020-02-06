#!/bin/sh

BREW_PREFIX_DIR=/usr/local

# Antibody (zsh plugin manager)
source <(antibody init)
antibody bundle < $ZSH_FILES/zsh_plugins.txt

# ASDF
source $BREW_PREFIX_DIR/opt/asdf/asdf.sh
source $BREW_PREFIX_DIR/opt/asdf/etc/bash_completion.d/asdf.bash

# Autojump
[[ -s $BREW_PREFIX_DIR/etc/autojump.sh ]] && source $BREW_PREFIX_DIR/etc/autojump.sh

# FZF auto-completion
[[ $- == *i* ]] && source $BREW_PREFIX_DIR/opt/fzf/shell/completion.zsh 2> /dev/null

# FZF key bindings
source $(brew --prefix)/opt/fzf/shell/key-bindings.zsh

# Pet
bindkey '^s' pet-select

# Tmux
tmux menu

# ZSH history substring search
source $BREW_PREFIX_DIR/share/zsh-history-substring-search/zsh-history-substring-search.zsh