#!/bin/sh

_run_test() {
  command bun run $@
}

bun() {
  case $1 in
    test)
      _run_test $@
      ;;
    *)
      command bun $@
  esac
}
