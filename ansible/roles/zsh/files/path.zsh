#!/bin/sh

PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
GNU_PATH="/usr/local/opt/coreutils/libexec/gnubin"
export PATH="$HOME/bin:$HOME/rbenv/bin:$GNU_PATH:$PATH"

MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export MANPATH
