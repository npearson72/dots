#!/bin/sh

tmux() {
  if [ "$1" = "menu" ]; then
    if [ ! -n "$TMUX" ] && [[ $(tmux ls 2> /dev/null | head -n 1) == *"created"* ]]; then
      list=$(tmux ls 2> /dev/null | grep -v attached)
      if [ -n "$list" ]; then
        selection=$(tmux ls 2> /dev/null | grep -v attached | fzf | cut -f 1 -d " ")
        if [ -n "$selection" ]; then
          tmux -f $HOME/.config/.tmux.conf attach -t ${selection: : -1}
        fi
      else
        echo "\nToto, I've a feeling we're not in tmux anymore."
      fi
    else
      command tmux -f $HOME/.config/.tmux.conf new -s default > /dev/null 2>&1
    fi
  else
    command tmux -f $HOME/.config/.tmux.conf $@
  fi
}
