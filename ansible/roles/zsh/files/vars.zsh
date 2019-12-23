#!/bin/sh

# Editor
export VISUAL=nvim
export GIT_EDITOR=$VISUAL
export EDITOR=$VISUAL

# Erlang/Elixir
export ERL_AFLAGS='-kernel shell_history enabled'

# FZF
export FZF_DEFAULT_OPTS='--height 50% --layout=reverse --border --no-mouse'

# FZF config to use ripgrep
export FZF_DEFAULT_COMMAND='rg --follow --hidden -l "" --glob "!.git/*" 2> /dev/null'

# OpenSSL
# For compilers to find openssl you may need to set:
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"

# For pkg-config to find openssl you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"

# Postgres
export PSQL_HISTORY=$HOME/.cache/.psql_history

# Terminal
if [ -n "$TMUX" ]; then
  export TERM=screen-256color
else
  export TERM=xterm-256color
fi
