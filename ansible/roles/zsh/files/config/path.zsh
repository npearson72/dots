# Path
PATH='/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin'

STTY_HACK='/usr/local/sbin'

GNU_PATH="$HOMEBREW_PREFIX_DIR/opt/opt/coreutils/libexec/gnubin:\
$HOMEBREW_PREFIX_DIR/opt/opt/findutils/libexec/gnubin:\
$HOMEBREW_PREFIX_DIR/opt/opt/gnu-tar/libexec/gnubin:\
$HOMEBREW_PREFIX_DIR/opt/opt/gnu-which/libexec/gnubin"

SSL_PATH="$HOMEBREW_PREFIX_DIR/opt/opt/openssl/bin"

ASDF_PATH="$HOME/.asdf/bin"

ANDROID_PATH="$HOME/Library/Android/sdk/platform-tools"

YARN_PATH="$HOME/.yarn/bin"

export PATH="$STTY_HACK:$GNU_PATH:$SSL_PATH:$ASDF_PATH:$ANDROID_PATH:$YARN_PATH:$PATH"

# Manpath
GNU_MANPATH="$HOMEBREW_PREFIX_DIR/opt/coreutils/libexec/gnuman:\
$HOMEBREW_PREFIX_DIR/opt/gnu-sed/libexec/gnuman:\
$HOMEBREW_PREFIX_DIR/opt/gnu-tar/libexec/gnuman:\
$HOMEBREW_PREFIX_DIR/opt/gnu-which/libexec/gnuman"

export MANPATH="$GNU_MANPATH:$MANPATH"
