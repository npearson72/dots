# Getting started

## 1. Clone repo to home directory
`git clone https://github.com/npearson72/dots.git ~/.dots && cd ~/.dots`

**Note:** Once you've cloned with `https` to reset the git remote url to `ssh` do:

`git remote set-url origin git@github.com:npearson72/dots.git`

## 2. Setup an .env file
`cp .env_example .env`

## 3. To install

#### To install everything
`sh ./install.sh`

#### To install specific features
`sh ./install.sh --tags x,y,z`

## To brew bundle / brew cleanup
`brew_bundle`

`brew_cleanup`

## Base Ansible command
`ansible-playbook main.yml -i inventory -v -K`
