#!/bin/sh

# Antibody (zsh plugin manager)
source <(antibody init)
antibody bundle < $ZSH_FILES/zsh_plugins.txt

# Autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# FZF
export FZF_DEFAULT_OPTS='--height 50% --layout=reverse --border'

if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="$PATH:/usr/local/opt/fzf/bin"
fi

# FZF auto-completion
[[ $- == *i* ]] && source '/usr/local/opt/fzf/shell/completion.zsh' 2> /dev/null

# FZF key bindings
source '/usr/local/opt/fzf/shell/key-bindings.zsh'

# Postgres
export PSQL_HISTORY=$HOME/.local/.psql_history

# Rbenv
if which rbenv >/dev/null; then
  eval "$(rbenv init -)"
fi

# ZSH history substring search
source '/usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh'
