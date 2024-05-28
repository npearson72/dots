# frozen_string_literal: true

work = File.read("#{Dir.home}/.dots/.env").match?(/COMPUTER_USE=(work|hybrid)/)
home = File.read("#{Dir.home}/.dots/.env").match?(/COMPUTER_USE=(home|hybrid)/)

tap 'homebrew/bundle'
tap 'homebrew/cask-fonts'
tap 'homebrew/services'
tap 'knqyf263/pet'
brew 'ansible'
brew 'autojump'
brew 'coreutils'
brew 'antidote'
brew 'asdf'
brew 'awscli'
brew 'bat'
brew 'cmake'
brew 'diff-so-fancy'
brew 'dockutil'
brew 'findutils'
brew 'fzf'
brew 'gawk'
brew 'gcc'
brew 'ghostscript' if work
brew 'git'
brew 'gpg'
brew 'gnu-sed'
brew 'gnu-tar'
brew 'gnu-which'
brew 'gzip'
brew 'htop'
brew 'imagemagick'
brew 'minikube'
brew 'mas'
brew 'neovim'
brew 'openssh'
brew 'postgresql@14'
brew 'postgis' if work
brew 'redis', restart_service: true
brew 'ripgrep'
brew 'tldr'
brew 'tmux'
brew 'tmuxp'
brew 'tree'
brew 'unzip'
brew 'zsh'
brew 'knqyf263/pet/pet'
cask '1password'
cask '1password-cli'
cask 'docker'
cask 'dropbox' if home
cask 'figma'
cask 'font-hack-nerd-font'
cask 'google-chrome', args: { appdir: '/Applications' }
cask 'hammerspoon'
cask 'iina'
cask 'microsoft-teams' if work
cask 'ngrok'
cask 'notunes'
cask 'pgadmin4'
cask 'postman'
cask 'rectangle'
cask 'slack' if work
cask 'transmission' if home
mas 'Bear', id: '1091189122'.to_i
