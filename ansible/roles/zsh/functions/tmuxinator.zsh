#!/bin/sh

_active_mux_menu() {
  all_sessions=($(_global_mux list | sed -n 2p))
  active_sessions=($(tmux list-sessions | cut -f 1 -d ' ' | cut -f 1 -d ':'))

  menu=()

  for i in "${all_sessions[@]}";
  do
    for i2 in "${active_sessions[@]}";
    do
      if [[ $i = $i2 && ! ${menu[(r)$i \(active\)]} ]]; then
        menu+=("$i (active)")
      fi
    done
    if [[ ! ${menu[(r)$i]} && ! ${menu[(r)$i \(active\)]} ]]; then
      menu+=($i)
    fi
  done

  for i in ${menu[@]}; do echo $i; done | sort
}

_select_menu_item() {
  if [[ $1 =~ '(active)' ]]; then
    item=$(echo $1 | cut -f 1 -d ' ')
    _global_mux $item &> /dev/null
  else
    _global_mux $1 &> /dev/null
  fi
}

_halt_vagrant() {
  pwd=$PWD
  cd $HOME/Dev/trs/ansible
  if [[ $(vagrant status | grep -c running) -ge 1 ]]; then
    vagrant halt
  fi
  cd $pwd
}

_kill_processes() {
  tmux list-panes -s -F "#{pane_pid} #{pane_current_command}" -t $1 | grep -v tmux | cut -f 1 -d ' ' | xargs kill
}

_killer_mux() {
  if [[ $2 = trs ]]; then _halt_vagrant; fi
  _kill_processes $2
  _global_mux $@
}

_global_mux() {
  global_version=$(cat $HOME/.tool-versions | grep ruby | cut -f 2 -d ' ')
  $HOME/.asdf/installs/ruby/$global_version/bin/tmuxinator $@
}

tmuxinator() {
  if [[ -z $1 ]]; then
    menu_item=$(_active_mux_menu | fzf)
    _select_menu_item $menu_item
  elif [[ $1 = stop ]]; then
    _killer_mux $@
  else
    _global_mux $@
  fi
}

mux() {
  tmuxinator $@
}
