#!/bin/sh

alias ll="ls -lhA"
alias vim="nvim"
alias vi="nvim"
alias reload!="source $HOME/.zshrc"
alias start_rails="bundle exec rails s -b 0.0.0.0"

alias brew_bundle="brew bundle -v --file=$HOME/.config/Brewfile"
alias brew_cleanup="brew bundle cleanup -v --force --file=$HOME/.config/Brewfile"
alias brew_check="brew bundle check -v --file=$HOME/.config/Brewfile"
