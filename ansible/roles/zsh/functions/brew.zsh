#!/bin/sh

brew() {
  if [[ $1 = bundle ]]
  then
    if [[ $@ =~ cleanup ]]; then
      command brew cleanup -s
      command brew $@ -v --force --zap --file="$HOME/.config/Brewfile"
    else
      command brew $@ -v --file="$HOME/.config/Brewfile"
    fi
  else
    command brew $@
  fi
}
