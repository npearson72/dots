#!/bin/sh

git_fzf_show() {
  format="%Cred%h%Creset - %s%C(yellow)%d%Creset %Cgreen(%cr) \
    %C(bold blue)<%an>%Creset"

  bind="ctrl-m:execute: (grep -o '[a-f0-9]\{7\}' | head -1 | xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
  {} FZF-EOF"

  git log --graph --color=always --format=$format "$@" | fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort --bind $bind
}

git() {
  if [ "$1" = "add" ] && [ -z "$2" ]; then
    command git add $(git ls-files -m -o --exclude-standard | fzf -m)
  elif [ "$1" = "rm" ] && [ -z "$2" ]; then
    command git rm $(git ls-files -d --exclude-standard | fzf -m)
  elif [ "$1" = "reset" ] && [ -z "$2" ]; then
    command git diff --name-only --cached | fzf -m | xargs -I {} sh -c 'git reset -- $0' {} > /dev/null 2>&1
  elif [ "$1" = "show" ] && [ "$2" -eq 0 ]; then
    git_fzf_show
  else
    command git $@
  fi
}
