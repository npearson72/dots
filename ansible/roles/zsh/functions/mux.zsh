#!/bin/sh

mux() {
  tmuxp_configs=("ams" "bms" "cp" "mp" "lms" "uw" "kipper")

  if [[ $1 = "kill" ]]; then
    tmux list-panes -s -F "#{pane_pid} #{pane_current_command}" -t $2 | grep -v tmux | cut -f 1 -d ' ' | xargs kill
    tmux kill-session -t $2
  elif [[ $1 = "acima" ]]; then
    for conf in $tmuxp_configs; do
      tmuxp load -d $XDG_CONFIG_HOME/tmuxp/$conf.yml
    done
  elif [[ ${tmuxp_configs[*]} =~ $1 ]]; then
    tmuxp load -d $XDG_CONFIG_HOME/tmuxp/$1.yml -y
  else
    tmuxp $1
  fi
}
