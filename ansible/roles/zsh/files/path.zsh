#!/bin/sh

PATH='/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin'
GNU_PATH='/usr/local/opt/coreutils/libexec/gnubin'
STTY_HACK='/usr/local/sbin'
export PATH="$HOME/bin:$HOME/rbenv/bin:$STTY_HACK:$GNU_PATH:$PATH"

MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export MANPATH
