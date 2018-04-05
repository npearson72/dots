#!/bin/sh

alias ls='gls -lh --color'
alias ll='gls -lha --color'
if type nvim > /dev/null 2>&1; then
  alias vim=nvim
  alias vi=vim
fi
alias reload!="source $HOME/.zshrc"
alias start_rails="bundle exec rails s -b 0.0.0.0"
alias brew_bundle="brew bundle -v --file=$HOME/.local/Brewfile"
alias brew_cleanup="brew bundle cleanup -v --force --file=$HOME/.local/Brewfile"
alias brew_check="brew bundle check -v --file=$HOME/.local/Brewfile"
