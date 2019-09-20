# frozen_string_literal: true

work = File.readlines("#{Dir.home}/.dots/.env").any? do |line|
  line.match?(/COMPUTER_TYPE.*work/)
end

tap 'getantibody/tap'
tap 'homebrew/bundle'
tap 'homebrew/cask'
tap 'homebrew/cask-fonts'
tap 'homebrew/cask-versions'
tap 'homebrew/core'
tap 'homebrew/services'
tap 'knqyf263/pet'
cask 'homebrew/cask-versions/adoptopenjdk8'
brew 'ansible'
brew 'asdf'
brew 'autojump'
brew 'awscli'
brew 'bat'
brew 'cmake'
brew 'coreutils'
brew 'diff-so-fancy'
brew 'elasticsearch', restart_service: true
brew 'findutils'
brew 'fzf'
brew 'gawk'
brew 'ghostscript' if work
brew 'git'
brew 'gpg'
brew 'gnu-sed'
brew 'gnu-tar'
brew 'gnu-which'
brew 'gzip'
brew 'htop'
brew 'imagemagick'
brew 'kibana'
brew 'knqyf263/pet/pet'
brew 'mas'
brew 'neovim'
brew 'openconnect' if work
brew 'openssh'
brew 'postgresql', restart_service: true
brew 'python'
brew 'python@2'
brew 'redis', restart_service: true
brew 'ripgrep'
brew 'tldr'
brew 'tmux'
brew 'tree'
brew 'unrar'
brew 'unzip'
brew 'wget'
brew 'yarn'
brew 'zsh'
brew 'zsh-history-substring-search'
brew 'getantibody/tap/antibody'
cask '1password'
cask 'bartender' unless work
cask 'bettertouchtool'
cask 'docker'
cask 'dropbox'
cask 'font-hack-nerd-font'
cask 'google-chrome', args: { appdir: '/Applications' }
cask 'iterm2'
cask 'java'
cask 'kap'
cask 'karabiner-elements' unless work
cask 'phantomjs'
cask 'postman'
cask 'slack' if work
cask 'transmission' unless work
cask 'vagrant' unless work
cask 'virtualbox' unless work
cask 'vlc'
mas 'Bear', id: '1091189122'.to_i
