#!/bin/sh

# Bat
export BAT_THEME="base16"

# Editor
export VISUAL=nvim
export GIT_EDITOR=$VISUAL
export EDITOR=$VISUAL

# Erlang/Elixir
export ERL_AFLAGS='-kernel shell_history enabled'

# FZF
export FZF_DEFAULT_OPTS="--height 50% --layout=reverse --border --no-mouse --tiebreak=index"
export FZF_CTRL_T_OPTS=$FZF_DEFAULT_OPTS

# FZF config to use ripgrep
export FZF_DEFAULT_COMMAND='rg --follow --hidden -l "" --glob "!.git/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND

# OpenSSL
# For compilers to find openssl you may need to set:
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"

# For pkg-config to find openssl you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"

# Postgres
export PSQL_HISTORY=$HOME/.cache/.psql_history

# Ripgrep (aka: rg)
export RIPGREP_CONFIG_PATH=$HOME/.config/.ripgreprc

# Terminal
if [ -n "$TMUX" ]; then
  export TERM=screen-256color
else
  export TERM=xterm-256color
fi
