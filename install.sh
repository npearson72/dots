#!/bin/sh
set -e

source ./ansible/roles/zsh/functions/buildosx
buildosx $@

exit 0
