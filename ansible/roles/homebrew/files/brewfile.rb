# frozen_string_literal: true

work = File.readlines("#{Dir.home}/.dots/.env").any? do |line|
  line.match?(/COMPUTER_TYPE.*work/)
end

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
brew 'dockutil'
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
cask 'dropbox'
cask 'figma' unless work
cask 'font-hack-nerd-font'
cask 'google-chrome', args: { appdir: '/Applications' }
cask 'hammerspoon'
cask 'iina'
cask 'kitty'
cask 'ngrok'
cask 'phantomjs'
cask 'postman'
cask 'rectangle'
cask 'slack'
cask 'telegram' unless work
cask 'transmission' unless work
mas 'Bear', id: '1091189122'.to_i
