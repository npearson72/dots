#!/bin/sh

function brew {
  if [ $1 = bundle ]
  then
    if [[ $@ =~ cleanup ]]; then
      /usr/local/bin/brew $@ -v --force --zap --file="$HOME/.local/Brewfile"
    else
      /usr/local/bin/brew $@ -v --file="$HOME/.local/Brewfile"
    fi
  else
    /usr/local/bin/brew $@
  fi
}
