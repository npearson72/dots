#!/bin/sh
set -o nounset -o pipefail -o errexit

# Load all variables from .env and export them all for Ansible to read
set -o allexport
source "$(dirname $0)/.env"
set +o allexport

installHomeBrew() {
  if ! [[ $(which brew) ]]; then
    echo "\n=> Installing Homebrew\n"

    /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi
}

installAnsible() {
  echo "\n=> Installing Ansible\n"

  brew install ansible
}

buildAnsible() {
  echo "\n=> Building Ansible Playbooks\n"
  
  exec ansible-playbook ansible/main.yml -i ansible/hosts -v -K $@
}

run() {
  installHomeBrew

  if ! [[ $(which ansible) ]]; then
    installAnsible
    buildAnsible $@
  else
    buildAnsible $@
  fi

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
