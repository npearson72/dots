#!/bin/sh

alias ls='gls -lhN --color'
alias ll='gls -lhaN --color'
if type nvim > /dev/null 2>&1; then
  alias vim=nvim
  alias vi=vim
fi
alias reload!="source $HOME/.zshrc"
alias start_rails="bundle exec rails s -b 0.0.0.0"
alias rc="rancher_console"
