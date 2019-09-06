#!/bin/sh
set -e

SCRIPT_ROOT=$(dirname $0)

get_args() {
  while [[ $# -gt 0 ]]; do
    case "$1" in
      -t|--tags)
        ANSIBLE_TAGS=$2
        shift
        ;;
      -t|--skip-tags)
        SKIP_ANSIBLE_TAGS=$2
        shift
        ;;
      *)
        echo "Invalid option: $1"
        ;;
    esac
    shift
  done
}

installHomeBrew() {
  if ! [[ $(which brew) ]]; then
    echo "\n=> Installing Homebrew\n"

    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
}

installAnsible() {
  echo "\n=> Installing Ansible\n"

  brew install ansible
}

buildAnsible() {
  echo "\n=> Building Ansible Playbooks\n"

  if [[ $ANSIBLE_TAGS && ! $SKIP_ANSIBLE_TAGS ]]; then
    sh -ac ". ./.env && ansible-playbook ansible/main.yml -i ansible/hosts -v -K --tags $ANSIBLE_TAGS"
  elif [[ ! $ANSIBLE_TAGS && $SKIP_ANSIBLE_TAGS ]]; then
    sh -ac ". ./.env && ansible-playbook ansible/main.yml -i ansible/hosts -v -K --skip-tags $SKIP_ANSIBLE_TAGS"
  elif [[ $ANSIBLE_TAGS && $SKIP_ANSIBLE_TAGS ]]; then
    sh -ac ". ./.env && ansible-playbook ansible/main.yml -i ansible/hosts -v -K --tags $ANSIBLE_TAGS --skip-tags $SKIP_ANSIBLE_TAGS"
  else
    sh -ac ". ./.env && ansible-playbook ansible/main.yml -i ansible/hosts -v -K"
  fi
}

run() {
  installHomeBrew

  if ! [[ $(which ansible) ]]; then
    installAnsible
    buildAnsible
  else
    buildAnsible
  fi

  echo "\n=> Finished!\n"
}


# Run...

cd $SCRIPT_ROOT

if [ -f $(pwd)/.env ]; then
  get_args $@
  run
else
  echo "\n=> Missing '$(pwd)/.env'. Make one first! Goodbye."
fi

exit 0
