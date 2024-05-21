#!/bin/sh

_get_caffeinated_pid() {
  ps aux | grep caffeinate | grep -v grep | tr -s ' ' | sed -z 's/\012/ /g' | rev | cut -d ' ' -f 1 | rev
}

_get_caffeinated_apps() {
  xargs -I {} sh -c 'ps -p {} -o comm=' | rev | cut -d / -f 1 | rev
}

_stay_awake_status() {
  apps=$(_get_caffeinated_pid | _get_caffeinated_apps)

  if [[ -n $apps ]]; then
    echo "The following apps are caffeinated:\n$apps"
  else
    echo "No apps appear to be caffeinated"
  fi
}

stay_awake() {
  if [[ $1 = --status ]]; then
    _stay_awake_status
  else
    pid=$(ps aux | grep -i $1 | grep -v grep | tr -s ' ' | cut -d ' ' -f 2)

    if [[ -n $pid ]]; then
      caffeinate -w $pid &
    else
      echo "$1 does not appear to be running"
    fi
  fi
}
