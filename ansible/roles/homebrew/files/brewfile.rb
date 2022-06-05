# frozen_string_literal: true

work = File.read("#{Dir.home}/.dots/.env").match?(/COMPUTER_USE=(work|hybrid)/)
home = File.read("#{Dir.home}/.dots/.env").match?(/COMPUTER_USE=(home|hybrid)/)

tap 'elastic/tap'
tap 'homebrew/bundle'
tap 'homebrew/cask'
tap 'homebrew/cask-fonts'
tap 'homebrew/cask-versions'
tap 'homebrew/core'
tap 'homebrew/services'
tap 'knqyf263/pet'
brew 'ansible'
brew 'coreutils'
brew 'antibody'
brew 'asdf'
brew 'awscli'
brew 'bat'
brew 'cmake'
brew 'diff-so-fancy'
# brew 'dockutil'
brew 'elastic/tap/elasticsearch-full', restart_service: true if work
brew 'elastic/tap/kibana-full' if work
brew 'fasd'
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
brew 'kubectl'
brew 'minikube'
brew 'mas'
brew 'neovim'
brew 'openconnect' if work
brew 'openssh'
brew 'postgresql'
brew 'postgis' if work
brew 'redis', restart_service: true
brew 'ripgrep'
brew 'tldr'
brew 'tmux'
brew 'tmuxp'
brew 'tree'
brew 'unzip'
brew 'watchman'
brew 'wget'
brew 'zsh'
brew 'zsh-history-substring-search'
brew 'knqyf263/pet/pet'
cask '1password'
cask 'adoptopenjdk8'
cask 'authy'
cask 'docker'
cask 'hpedrorodrigues/tools/dockutil' # Temp fix https://github.com/kcrawford/dockutil/issues/127
cask 'dropbox'
cask 'figma' if home
cask 'font-hack-nerd-font'
cask 'google-chrome', args: { appdir: '/Applications' }
cask 'hammerspoon'
cask 'iina'
cask 'kitty'
cask 'ngrok'
cask 'phantomjs'
cask 'postman'
cask 'rectangle'
cask 'slack' if work
cask 'transmission' if home
mas 'Bear', id: '1091189122'.to_i
