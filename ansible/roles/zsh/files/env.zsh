#!/bin/sh

export VISUAL=nvim
export GIT_EDITOR=$VISUAL
export EDITOR=$VISUAL

GNU_PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/findutils/libexec/gnubin:/usr/local/opt/gnu-sed/libexec/gnubin:/usr/local/opt/gnu-tar/libexec/gnubin"
export MANPATH="$GNU_PATH:$MANPATH"
