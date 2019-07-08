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
  tmux list-panes -s -F "#{pane_pid} #{pane_current_command}" -t $1 | grep -v tmux | awk '{print $1}' | xargs kill
}

_killer_mux() {
  if [[ $2 = trs ]]; then _halt_vagrant; fi
  _kill_processes $2
  global_mux $@
}

tmuxinator() {
  if [[ -z $1 ]]; then
    global_mux list | tail -n 1 | tr -s ' ' '\n' | fzf | xargs global_mux &> /dev/null
  elif [[ $1 = stop ]]; then
    _killer_mux $@
  else
    global_mux $@
  fi
}

mux() {
  tmuxinator $@
}

global_mux() {
  global_version=$(cat $HOME/.tool-versions | grep ruby | cut -f 2 -d ' ')
  $HOME/.asdf/installs/ruby/$global_version/bin/tmuxinator $@
}
