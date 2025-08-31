# frozen_string_literal: true

work = File.read("#{Dir.home}/.dots/.env").match?(/COMPUTER_USE=(work|hybrid)/)
home = File.read("#{Dir.home}/.dots/.env").match?(/COMPUTER_USE=(home|hybrid)/)

tap 'int128/kubelogin' if work
tap 'knqyf263/pet'
brew 'ansible'
brew 'antidote'
brew 'git'
brew 'asdf'
brew 'autojump'
brew 'awscli'
brew 'bat'
brew 'cmake'
brew 'coreutils'
brew 'diff-so-fancy'
brew 'dockutil'
brew 'fd'
brew 'findutils'
brew 'flyctl'
brew 'fzf'
brew 'gawk'
brew 'gcc'
brew 'ghostscript' if work
brew 'gnu-sed'
brew 'gnu-tar'
brew 'gnu-which'
brew 'gnupg'
brew 'gpg'
brew 'gzip'
brew 'htop'
brew 'imagemagick'
brew 'int128/kubelogin/kubelogin' if work
brew 'mas'
brew 'minikube'
brew 'neovim'
brew 'openssh'
brew 'postgresql@17', restart_service: :changed
brew 'redis', restart_service: :changed
brew 'ripgrep'
brew 'tldr'
brew 'tmux'
brew 'tmuxp'
brew 'tree'
brew 'unzip'
brew 'zsh'
brew 'knqyf263/pet/pet'
cask 'docker-desktop'
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
mas 'Bitwarden', id: '1352778147'.to_i, restart_service: :changed
