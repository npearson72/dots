# XDG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

export BAT_THEME=zenburn

# Brew
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_CLEANUP=1

# Brew bundle
export HOMEBREW_BUNDLE_FILE=$XDG_CONFIG_HOME/Brewfile
export HOMEBREW_BUNDLE_NO_LOCK=1

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

# Less
export LESSHISTFILE=$XDG_CACHE_HOME/.lesshst

# MySQL
export MYSQL_HISTFILE=$XDG_CACHE_HOME/.mysql_history

# Node
export NODE_REPL_HISTORY=$XDG_CACHE_HOME/.node_repl_history

# OpenSSL - for compilers to find openssl:
export LDFLAGS='-L/usr/local/opt/openssl/lib'
export CPPFLAGS='-I/usr/local/opt/openssl/include'

# OpenSSL - for pkg-config to find openssl:
export PKG_CONFIG_PATH='/usr/local/opt/openssl/lib/pkgconfig'

# Postgres
export PSQL_HISTORY=$XDG_CACHE_HOME/.psql_history

# Python Fix
export LANG=en_US.UTF-8

# Ripgrep (aka: rg)
export RIPGREP_CONFIG_PATH=$XDG_CONFIG_HOME/.ripgreprc

# ZSH
export HISTFILE=$XDG_CACHE_HOME/.zsh_history
