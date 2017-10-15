# Getting started

## Clone repo to home directory
`git clone git@github.com:npearson72/dots.git ~/.dots && cd ~/.dots`

## Setup an .env file
`cp .env_example .env`

## To install everything
`sh ./install.sh`

## To install specific features
`sh ./install.sh --tags x,y,z`

# Managing after install

## To replay Ansible
`buildosx`

-- or --

`buildosx --tags x,y,z`

## To brew bundle / brew cleanup
`brew_bundle`

`brew_cleanup`

## Base Ansible command
`ansible-playbook main.yml -i inventory -v -K`
