#!/bin/sh
set -o nounset -o pipefail -o errexit

# Load all variables from .env and export them all for Ansible to read
set -o allexport
source "$(dirname $0)/.env"
set +o allexport

run() {
  echo "\n=> Building Ansible Playbooks\n"
  
  exec ansible-playbook ansible/main.yml -i ansible/hosts -v -K $@

  echo "\n=> Finished!\n"
}

# Run...

cd $(dirname $0) # Run script from script root no matter where it's called

if [ -f $(pwd)/.env ]; then
  run $@
else
  echo "\n=> Missing '$(pwd)/.env'. Make one first! Goodbye."
fi

exit 0
