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
    --format="%Cred%h%Creset - %s%C(yellow)%d%Creset %Cgreen(%cr) %C(bold blue)<%an>%Creset" $@ |\
  fzf\
    --ansi\
    --tiebreak=index\
    --header "(press enter to preview)"\
    --bind "enter:execute: (grep -o '[a-f0-9]\{7\}' | head -1 | xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
  {} FZF-EOF"
}

_git_fzf_stash_apply() {
  if [ $(git stash list | wc -l) -gt 1 ]; then
    git stash list |
    fzf\
      --ansi\
      --tiebreak=index\
      --header "(press enter to preview or alt-enter to apply)"\
      --bind "alt-enter:execute(echo {} | grep -o 'stash@{[0-9]}' | xargs -I % sh -c 'git stash apply %')+abort"\
      --bind "enter:execute: (grep -o 'stash@{[0-9]}' | xargs -I % sh -c 'git stash show -p --color=always % | less -R') << 'FZF-EOF'
    {} FZF-EOF"
  else
    git stash apply stash@{0}
  fi
}

git() {
  if [ -z $2 ]; then
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
  elif [ $1 = stash ] && [ -z $3 ]; then
    case $2 in
      apply)
        _git_fzf_stash_apply
        ;;
      *)
        command git $@
    esac
  else
    command git $@
  fi
}
