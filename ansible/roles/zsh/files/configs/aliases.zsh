alias cat="bat --plain"
alias be="bundle exec"
alias ls="gls -lhN --color --group-directories-first --classify"
alias ll="ls -lhAN"
if [ -f $HOMEBREW_PREFIX_DIR/bin/nvim ]; then
  alias vim=nvim
  alias vi=nvim
fi
alias reload!="exec zsh -l"
alias start_rails="bundle exec rails s -b 0.0.0.0"
