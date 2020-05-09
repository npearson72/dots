#!/bin/sh

_tmux_sessions() {
  tmux ls 2> /dev/null
}

# This function will present a menu of active TMUX sesssions
#
# Usage: tmux menu
#
# Note: Will only work outside of TMUX
tmux() {
  config=$XDG_CONFIG_HOME/.tmux.conf

  if [[ $1 = menu ]]; then
    if [[ -z $TMUX ]] && [[ $(_tmux_sessions | grep -c created) -ge 1 ]]; then
      list=$(_tmux_sessions | grep -v attached)
      if [[ -n "$list" ]]; then
        selection=$(_tmux_sessions | grep -v attached | fzf | cut -f 1 -d ' ')
        if [[ -n "$selection" ]]; then
          command tmux -f $config attach -t ${selection: : -1}
        fi
      else
        echo "\nToto, I've a feeling we're not in tmux anymore."
      fi
    else
      command tmux -f $config new -s default 2> /dev/null
    fi
  else
    command tmux -f $config $@
  fi
}
