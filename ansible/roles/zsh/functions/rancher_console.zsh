#!/bin/sh

_login_to_rancher() {
  rancher exec -it \
    $(rancher ps -c | grep -i "\s$1-api-[0-9]" | cut -f 1 -d ' ' | head -n 1) bash
}

rancher_console() {
  if [[ $1 = production ]]; then
    export RANCHER_URL=$RANCHER_URL_PRODUCTION
    export RANCHER_ACCESS_KEY=$RANCHER_ACCESS_KEY_PRODUCTION
    export RANCHER_SECRET_KEY=$RANCHER_SECRET_KEY_PRODUCTION
    _login_to_rancher $2
  elif [[ $1 = staging ]]; then
    export RANCHER_URL=$RANCHER_URL_STAGING
    export RANCHER_ACCESS_KEY=$RANCHER_ACCESS_KEY_STAGING
    export RANCHER_SECRET_KEY=$RANCHER_SECRET_KEY_STAGING
    _login_to_rancher $2
  else
    command rancher $@
  fi
}

rc() {
  rancher_console $@
}
