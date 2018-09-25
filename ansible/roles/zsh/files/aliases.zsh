#!/bin/sh

alias ls='ls -lhN --color --group-directories-first --classify'
alias ll='ls -lhAN'
if type nvim > /dev/null 2>&1; then
  alias vim=nvim
  alias vi=nvim
fi
alias reload!="source $HOME/.zshrc"
alias start_rails="bundle exec rails s -b 0.0.0.0"
alias rc="rancher_console"
