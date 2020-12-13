#!/bin/sh

# Base
PATH='/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin'
STTY_HACK='/usr/local/sbin'
GNU_PATH="/usr/local/opt/coreutils/libexec/gnubin:\
/usr/local/opt/findutils/libexec/gnubin:\
/usr/local/opt/gnu-sed/libexec/gnubin:\
/usr/local/opt/gnu-tar/libexec/gnubin:\
/usr/local/opt/gnu-which/libexec/gnubin"
SSL_PATH='/usr/local/opt/openssl/bin'
ASDF_PATH="$HOME/.asdf/bin"
ANDROID_PATH="$HOME/Library/Android/sdk/platform-tools"

export PATH="$STTY_HACK:$GNU_PATH:$SSL_PATH:$ASDF_PATH:$ANDROID_PATH:$PATH"

# FZF
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="$PATH:/usr/local/opt/fzf/bin"
fi

MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export MANPATH
