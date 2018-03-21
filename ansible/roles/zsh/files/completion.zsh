#!/bin/sh

autoload -U compinit
compinit

# Use shift-tab to navigate backwards
zmodload zsh/complist
bindkey -M menuselect '^[[Z' reverse-menu-complete

# Matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Use highlight menus
zstyle ':completion:*' menu select

# Prevent completion when pasting text containing tabs
zstyle ':completion:*' insert-tab pending
