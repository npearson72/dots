#!/bin/sh

# Base
PATH='/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin'
STTY_HACK='/usr/local/sbin'
# Removing these from PATH to avoid build conflicts
# GNU_PATH="/usr/local/opt/coreutils/libexec/gnubin:\
# /usr/local/opt/findutils/libexec/gnubin:\
# /usr/local/opt/gnu-sed/libexec/gnubin:\
# /usr/local/opt/gnu-tar/libexec/gnubin:\
# /usr/local/opt/gnu-which/libexec/gnubin"
SSL_PATH='/usr/local/opt/openssl/bin'
ASDF_PATH="$HOME/.asdf/bin"
PUB_CACHE_PATH="$HOME/.pub-cache/bin" # Flutter pub binaries

export PATH="$STTY_HACK:$SSL_PATH:$ASDF_PATH:$PUB_CACHE_PATH:$PATH"

# FZF
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="$PATH:/usr/local/opt/fzf/bin"
fi

MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export MANPATH
