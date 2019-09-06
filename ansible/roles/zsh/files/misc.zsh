#!/bin/sh

# Antibody (zsh plugin manager)
source <(antibody init)
antibody bundle < $ZSH_FILES/zsh_plugins.txt

# ASDF (Warning: slow load time)
source $(brew --prefix asdf)/asdf.sh
# source $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash

# Autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# FZF
export FZF_DEFAULT_OPTS='--height 50% --layout=reverse --border --no-mouse'

if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="$PATH:/usr/local/opt/fzf/bin"
fi

# FZF auto-completion
[[ $- == *i* ]] && source $(brew --prefix)/opt/fzf/shell/completion.zsh 2> /dev/null

# FZF config to use ripgrep
export FZF_DEFAULT_COMMAND='rg --follow --hidden -l "" --glob "!.git/*" 2> /dev/null'

# FZF key bindings
source $(brew --prefix)/opt/fzf/shell/key-bindings.zsh

# OpenSSL
# For compilers to find openssl you may need to set:
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"

# For pkg-config to find openssl you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"

# Pet
bindkey '^s' pet-select

# Postgres
export PSQL_HISTORY=$HOME/.cache/.psql_history

# Tmux
tmux menu

# Tmuxinator
tmuxinator_version=$(cat $HOME/.tool-versions | grep ruby | cut -f 2 -d ' ')
source $($HOME/.asdf/installs/ruby/$tmuxinator_version/bin/gem which tmuxinator | rev | cut -d'/' -f3- | rev)/completion/tmuxinator.zsh

# ZSH history substring search
source '/usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh'
