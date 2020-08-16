#!/bin/sh

# XDG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

export BAT_THEME=zenburn

# Brew bundle
export HOMEBREW_BUNDLE_FILE=$XDG_CONFIG_HOME/Brewfile
export HOMEBREW_BUNDLE_NO_LOCK=false

# Editor
export VISUAL=nvim
export GIT_EDITOR=$VISUAL
export EDITOR=$VISUAL

# FZF
export FZF_DEFAULT_OPTS='--height 50% --layout=reverse --border --no-mouse --tiebreak=index'
export FZF_CTRL_T_OPTS=$FZF_DEFAULT_OPTS

# FZF config to use ripgrep
export FZF_DEFAULT_COMMAND='rg --follow --hidden -l "" --glob "!.git/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND

# OpenSSL
# For compilers to find openssl you may need to set:
export LDFLAGS='-L/usr/local/opt/openssl/lib'
export CPPFLAGS='-I/usr/local/opt/openssl/include'

# For pkg-config to find openssl you may need to set:
export PKG_CONFIG_PATH='/usr/local/opt/openssl/lib/pkgconfig'

# Postgres
export PSQL_HISTORY=$XDG_CACHE_HOME/.psql_history

# Ripgrep (aka: rg)
export RIPGREP_CONFIG_PATH=$XDG_CONFIG_HOME/.ripgreprc

# Terminal
if [ -n "$TMUX" ]; then
  export TERM=screen-256color
else
  export TERM=xterm-256color
fi
