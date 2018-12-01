#!/bin/sh

bindkey -e # Emacs key bindings for ZSH
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# ZSH history substring search
bindkey '^j' history-substring-search-up
bindkey '^k' history-substring-search-down
