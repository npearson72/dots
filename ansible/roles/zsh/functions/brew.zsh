#!/bin/sh

brew() {
  if [[ $1 = "bundle" ]]; then
    command sudo -Hu homebrew brew bundle $@
  else
    command sudo -Hu homebrew brew $@
  fi
}
