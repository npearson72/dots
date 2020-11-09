# frozen_string_literal: true

work = File.readlines("#{Dir.home}/.dots/.env").any? do |line|
  line.match?(/COMPUTER_TYPE.*work/)
end

tap 'getantibody/tap'
tap 'elastic/tap'
tap 'homebrew/bundle'
tap 'homebrew/cask'
tap 'homebrew/cask-fonts'
tap 'homebrew/cask-versions'
tap 'homebrew/core'
tap 'homebrew/services'
tap 'knqyf263/pet'
cask 'adoptopenjdk8'
brew 'ansible'
brew 'coreutils'
brew 'asdf'
brew 'awscli'
brew 'bat'
brew 'cmake'
brew 'diff-so-fancy'
brew 'dockutil'
brew 'elastic/tap/elasticsearch-oss', restart_service: true
brew 'elastic/tap/kibana-oss'
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
brew 'kubectl' if work
brew 'mas'
brew 'neovim'
brew 'openconnect' if work
brew 'openssh'
brew 'postgresql' if work
brew 'redis', restart_service: true
brew 'ripgrep'
brew 'tldr'
brew 'tmux'
brew 'tree'
brew 'unrar'
brew 'unzip'
brew 'watchman'
brew 'wget'
brew 'zsh'
brew 'zsh-history-substring-search'
brew 'getantibody/tap/antibody'
brew 'knqyf263/pet/pet'
cask '1password'
cask 'alacritty'
cask 'authy'
cask 'docker'
cask 'dropbox'
cask 'font-hack-nerd-font'
cask 'google-chrome', args: { appdir: '/Applications' }
cask 'hammerspoon'
cask 'java'
cask 'ngrok'
cask 'phantomjs'
cask 'postman'
cask 'rectangle'
cask 'slack'
cask 'transmission' unless work
cask 'vlc'
mas 'Bear', id: '1091189122'.to_i
