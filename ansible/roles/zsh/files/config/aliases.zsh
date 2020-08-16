#!/bin/sh

alias cat='bat'
alias be='bundle exec'
alias ls='ls -lhN --color --group-directories-first --classify'
alias ll='ls -lhAN'
if command -v nvim &> /dev/null; then
  alias vim=nvim
  alias vi=nvim
fi
alias reload!='exec zsh -l'
alias start_rails='bundle exec rails s -b 0.0.0.0'
alias j='fasd_cd -d'
