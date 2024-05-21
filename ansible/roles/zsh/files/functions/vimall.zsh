#!/bin/sh

# Pipe list of files into `vimall` to open each in tabs
#
# Ex: git diff HEAD~1 --name-only | vimall
#

vimall() {
  array=()
  while IFS= read line; do
    array+=("$(git rev-parse --show-toplevel)/${line}")
  done
  echo $array | xargs -I {} sh -c 'nvim -p {}'
}
