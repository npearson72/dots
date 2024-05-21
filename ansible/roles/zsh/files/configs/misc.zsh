# Antidote (zsh plugin manager)
source $HOMEBREW_PREFIX_DIR/opt/antidote/share/antidote/antidote.zsh
source <(antidote init)
antidote bundle < $ZSH_FILES/zsh_plugins.txt

# ASDF
source $HOMEBREW_PREFIX_DIR/opt/asdf/libexec/asdf.sh
source $HOMEBREW_PREFIX_DIR/share/zsh/site-functions

# Autojump
if [ -f $HOMEBREW_PREFIX_DIR/etc/profile.d/autojump.sh ]; then
  source $HOMEBREW_PREFIX_DIR/etc/profile.d/autojump.sh
fi

# FZF auto-completion
[[ $- == *i* ]] && source $HOMEBREW_PREFIX_DIR/opt/fzf/shell/completion.zsh 2> /dev/null

# FZF key bindings
source $HOMEBREW_PREFIX_DIR/opt/fzf/shell/key-bindings.zsh

# Homebrew
eval "$($HOMEBREW_PREFIX_DIR/bin/brew shellenv)"

# Pet
bindkey '^s' pet-select

# Tmux
tmux menu
