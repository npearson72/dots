#!/bin/sh

_pg_current_running_version() {
  ps aux | grep postgres | grep -Eo '/usr/local/var/postgres-.*' | grep -Eo '[0-9].*'
}

_pg_running() {
  if [[ $(_pg_current_running_version) = '' ]]; then
    echo false
  else
    echo true
  fi
}

_pg_global_version() {
  cat $HOME/.tool-versions | grep postgres | cut -f 2 -d ' '
}

_pg_local_version() {
  cat $(pwd)/.tool-versions | grep postgres | cut -f 2 -d ' '
}

_pg_status() {
  if [[ $(_pg_running) = true ]]; then
    echo Postgres version $(_pg_current_running_version) is running
  else
    echo Postgres is not running
  fi
}

_pg_stop() {
  if [[ $(_pg_running) = true ]]; then
    pg_ctl -D /usr/local/var/postgres-$(_pg_current_running_version) stop
  else
    echo Postgres is not running
  fi
}

_pg_start() {
  if [[ $(_pg_running) = true ]]; then
    echo Postgres version $(_pg_current_running_version) is already running
  else
    _pg_start_process
  fi
}

_pg_start_process() {
  if [[ -f $(pwd)/.tool-versions ]]; then
    pg_ctl -D /usr/local/var/postgres-$(_pg_local_version) start
  else
    pg_ctl -D /usr/local/var/postgres-$(_pg_global_version) start
  fi
}

pg() {
  case $1 in
    status)
      _pg_status
      ;;
    start)
      _pg_start
      ;;
    stop)
      _pg_stop
      ;;
    restart)
      _pg_stop
      _pg_start
      ;;
  esac
}
