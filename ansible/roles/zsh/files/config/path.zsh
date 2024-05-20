# Path
PATH='/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin'

STTY_HACK='/usr/local/sbin'

GNU_PATH="$HOMEBREW_PREFIX_DIR/opt/coreutils/libexec/gnubin:\
$HOMEBREW_PREFIX_DIR/opt/findutils/libexec/gnubin:\
$HOMEBREW_PREFIX_DIR/opt/gnu-tar/libexec/gnubin:\
$HOMEBREW_PREFIX_DIR/opt/gnu-which/libexec/gnubin"

SSL_PATH="$HOMEBREW_PREFIX_DIR/opt/openssl/bin"

ANDROID_PATH="$HOME/Library/Android/sdk/platform-tools"

export PATH="$STTY_HACK:$GNU_PATH:$SSL_PATH:$ANDROID_PATH:$PATH"

# Manpath
GNU_MANPATH="$HOMEBREW_PREFIX_DIR/opt/coreutils/libexec/gnuman:\
$HOMEBREW_PREFIX_DIR/opt/gnu-sed/libexec/gnuman:\
$HOMEBREW_PREFIX_DIR/opt/gnu-tar/libexec/gnuman:\
$HOMEBREW_PREFIX_DIR/opt/gnu-which/libexec/gnuman"

export MANPATH="$GNU_MANPATH:$MANPATH"
