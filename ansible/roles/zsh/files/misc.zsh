#!/bin/sh

# Antibody (zsh plugin manager)
source <(antibody init)
antibody bundle < $ZSH_FILES/zsh_plugins.txt

# ASDF
source /usr/local/opt/asdf/asdf.sh
source /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash

# Autojump
[[ -s /usr/local/etc/autojump.sh ]] && . /usr/local/etc/autojump.sh

# FZF auto-completion
[[ $- == *i* ]] && source /usr/local/opt/fzf/shell/completion.zsh 2> /dev/null

# FZF key bindings
source $(brew --prefix)/opt/fzf/shell/key-bindings.zsh

# Pet
bindkey '^s' pet-select

# Tmux
tmux menu

# ZSH history substring search
source '/usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh'
