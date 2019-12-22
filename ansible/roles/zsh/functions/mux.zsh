#!/bin/bash

mux() {
  if [[ $1 = "kill" ]]; then
    tmux list-panes -s -F "#{pane_pid} #{pane_current_command}" -t $2 | grep -v tmux | cut -f 1 -d ' ' | xargs kill
    tmux kill-session -t $2
  elif [ -z "$1" ]; then
    command tmuxp
  else
    command tmuxp load $HOME/.config/tmuxp/$1.yml -y
  fi
}
