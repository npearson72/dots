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
[[ $- == *i* ]] && source "$(brew --prefix)/opt/fzf/shell/completion.zsh" 2> /dev/null

# FZF config to use ripgrep
export FZF_DEFAULT_COMMAND='rg --hidden -l "" --glob "!.git/*"'

# FZF key bindings
source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"

# Postgres
export PSQL_HISTORY=$HOME/.cache/.psql_history

# Rbenv
if which rbenv >/dev/null; then
  eval "$(rbenv init -)"
fi

# Tmuxinator
if [ ! -n "$TMUX" ]; then
  tmux_gem_path=$(gem which tmuxinator | rev | cut -d'/' -f3- | rev)
  source "$tmux_gem_path/completion/tmuxinator.zsh"
fi

# ZSH history substring search
source '/usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh'
