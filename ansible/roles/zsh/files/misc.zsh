#!/bin/sh

# Autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# Rbenv
if which rbenv >/dev/null; then
  eval "$(rbenv init -)"
fi

# Postgres
export PSQL_HISTORY=$HOME/.local/.psql_history
