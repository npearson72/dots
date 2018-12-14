#!/bin/sh

_git_fzf_add() {
  git ls-files -m -o --exclude-standard | fzf -m | xargs -I {} sh -c 'git add {}'
}

_git_fzf_rm() {
  git ls-files -m -o --exclude-standard | fzf -m | xargs -I {} sh -c 'git rm {}'
}

_git_fzf_reset() {
  git diff --name-only --cached | fzf -m | xargs -I {} sh -c 'git reset -- {}'
}

_git_fzf_checkout_branch() {
  git branch | grep -v '^*' | fzf | xargs -I {} sh -c 'git checkout {}'
}

_git_fzf_show() {
  git log\
    --graph\
    --color=always\
    --format="%Cred%h%Creset - %s%C(yellow)%d%Creset %Cgreen(%cr) %C(bold blue)<%an>%Creset" "$@" |\
  fzf\
    --ansi\
    --no-sort\
    --reverse\
    --tiebreak=index\
    --bind=ctrl-s:toggle-sort\
    --bind "ctrl-m:execute: (grep -o '[a-f0-9]\{7\}' | head -1 | xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
  {} FZF-EOF"
}

git() {
  if [ -z "$2" ]; then
    case $1 in
      add)
        _git_fzf_add
        ;;
      rm)
        _git_fzf_rm
        ;;
      reset)
        _git_fzf_reset
        ;;
      cob)
        _git_fzf_checkout_branch
        ;;
      show)
        _git_fzf_show
        ;;
      *)
        command git $@
    esac
  else
    command git $@
  fi
}
