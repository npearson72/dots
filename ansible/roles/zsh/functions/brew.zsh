#!/bin/sh

brew() {
  if [ $1 = bundle ]
  then
    if [[ $@ =~ cleanup ]]; then
      /usr/local/bin/brew $@ -v --force --zap --file="$HOME/.config/Brewfile"
    else
      /usr/local/bin/brew $@ -v --file="$HOME/.config/Brewfile"
    fi
  else
    /usr/local/bin/brew $@
  fi
}
