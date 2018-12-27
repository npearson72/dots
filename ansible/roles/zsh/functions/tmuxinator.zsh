#!/bin/sh

_halt_vagrant() {
  pwd=$PWD
  cd $HOME/Dev/trs/ansible
  if [[ $(vagrant status | grep -c running) -ge 1 ]]; then
    vagrant halt
  fi
  cd $pwd
}

_kill_processes() {
  tmux list-panes -s -F "#{pane_pid} #{pane_current_command}" | grep -v tmux | awk '{print $1}' | xargs kill
}

_killer_mux() {
  if [[ $2 = trs ]]; then _halt_vagrant; fi
  _kill_processes
  command tmuxinator $@
}

tmuxinator() {
  if [[ -z $1 ]]; then
    selection=$(command tmuxinator list | tail -n 1 | tr -s ' ' '\n' | fzf)
    if [[ -n $selection ]]; then
      command tmuxinator $selection
    fi
  elif [[ $1 = stop ]]; then
    _killer_mux $@
  else
    command tmuxinator $@
  fi
}

mux() {
  tmuxinator $@
}
