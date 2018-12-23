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
  if [[ $1 = stop ]]; then
    if [[ $2 = trs ]]; then _halt_vagrant; fi
    _kill_processes
  fi
  command tmuxinator $@
}

mux() {
  _killer_mux $@
}

tmuxinator() {
  _killer_mux $@
}
