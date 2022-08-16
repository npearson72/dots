BREW_PREFIX_DIR=/usr/local

# Antibody (zsh plugin manager)
source <(antibody init)
antibody bundle < $ZSH_FILES/zsh_plugins.txt

# ASDF
source $BREW_PREFIX_DIR/opt/asdf/libexec/asdf.sh
source $BREW_PREFIX_DIR/share/zsh/site-functions

# fasd
eval "$(fasd --init posix-alias zsh-hook)"

# FZF auto-completion
[[ $- == *i* ]] && source $BREW_PREFIX_DIR/opt/fzf/shell/completion.zsh 2> /dev/null

# FZF key bindings
source $BREW_PREFIX_DIR/opt/fzf/shell/key-bindings.zsh

# Pet
bindkey '^s' pet-select

# Rust (Rustup - https://rustup.rs)
. "$HOME/.cargo/env"

# Tmux
tmux menu

# ZSH history substring search
source $BREW_PREFIX_DIR/share/zsh-history-substring-search/zsh-history-substring-search.zsh
