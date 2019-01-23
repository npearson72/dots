#!/bin/sh

# Pipe list of files into `vimall` to open each in tabs
#
# Ex: git diff HEAD~1 --name-only | vimall
#

vimall() {
  paste -s -d' ' | xargs -I {} sh -c 'nvim -p {}'
}
