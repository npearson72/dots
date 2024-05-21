# Only check once a day
# https://htr3n.github.io/2018/07/faster-zsh/
autoload -Uz compinit
if [ $(date +'%j') != $(/usr/bin/stat -f '%Sm' -t '%j' ${ZDOTDIR:-$HOME}/.zcompdump) ]; then
  compinit
else
  compinit -C
fi

# Use shift-tab to navigate backwards
zmodload zsh/complist
bindkey -M menuselect '^[[Z' reverse-menu-complete

# Matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Prevent completion when pasting text containing tabs
zstyle ':completion:*' insert-tab pending

# Style
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Docker completion
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes
