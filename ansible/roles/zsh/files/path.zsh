#!/bin/sh

PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
GNU_PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/findutils/libexec/gnubin:/usr/local/opt/gnu-sed/libexec/gnubin:/usr/local/opt/gnu-tar/libexec/gnubin"
export PATH="$GNU_PATH:$HOME/bin:$HOME/rbenv/bin:$PATH"

MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export MANPATH
