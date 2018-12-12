#!/bin/sh

function rancher_console {
  if [ $1 = production ]
  then
    export RANCHER_URL=$RANCHER_URL_PRODUCTION
    export RANCHER_ACCESS_KEY=$RANCHER_ACCESS_KEY_PRODUCTION
    export RANCHER_SECRET_KEY=$RANCHER_SECRET_KEY_PRODUCTION
  elif [ $1 = staging ]
  then
    export RANCHER_URL=$RANCHER_URL_STAGING
    export RANCHER_ACCESS_KEY=$RANCHER_ACCESS_KEY_STAGING
    export RANCHER_SECRET_KEY=$RANCHER_SECRET_KEY_STAGING
  fi

  id=$(rancher ps -c | grep -i "\s$2-api-[0-9]" | cut -f 1 -d' ' | head -n 1)
  rancher exec -it $id bash
}
