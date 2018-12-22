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
    --color=always\
    --pretty=format:'%Cred%h%Creset - %s%C(yellow)%d%Creset %Cgreen(%cr) %C(bold blue)<%an>%Creset' |\
  fzf\
    --ansi\
    --tiebreak=index\
    --header "<enter> view commit | <ctrl-p> toggle preview window | <esc> quit"\
    --preview "echo {} | grep -o '[a-f0-9]\{7\}' | head -1 | xargs -I % sh -c 'git show --color=always %' | diff-so-fancy"\
    --preview-window "hidden"\
    --bind "ctrl-p:toggle-preview"\
    --bind "enter:execute: (grep -o '[a-f0-9]\{7\}' | head -1 | xargs -I % sh -c 'git show --color=always %' | diff-so-fancy | less -R) << 'FZF-EOF'
  {} FZF-EOF"
}

_git_fzf_stash_list() {
  git stash list\
    --color=always\
    --pretty=format:'%Cred%gd%Creset - %s%C(yellow)%d%Creset %Cgreen(%cr) %C(bold blue)' |\
  fzf\
    --ansi\
    --tiebreak=index\
    --header "<enter> view stash | <alt-enter> apply stash | <alt-d> drop stash | <ctrl-p> toggle preview window | <esc> quit"\
    --preview "echo {} | grep -o 'stash@{[0-9]}' | head -1 | xargs -I % sh -c 'git show --color=always %' | diff-so-fancy"\
    --preview-window "hidden"\
    --bind "ctrl-p:toggle-preview"\
    --bind "alt-d:execute(echo {} | grep -o 'stash@{[0-9]}' | xargs -I % sh -c 'git stash drop %')+abort"\
    --bind "alt-enter:execute(echo {} | grep -o 'stash@{[0-9]}' | xargs -I % sh -c 'git stash apply %')+abort"\
    --bind "enter:execute: (grep -o 'stash@{[0-9]}' | xargs -I % sh -c 'git stash show -p --color=always %' | diff-so-fancy | less -R) << 'FZF-EOF'
  {} FZF-EOF"
}

_git_fzf_stash_apply() {
  if [ $(git stash list | wc -l) -gt 1 ]; then
    _git_fzf_stash_list
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
      show|lg)
        _git_fzf_show
        ;;
      *)
        command git $@
    esac
  elif [ $1 = stash ] && [ -z $3 ]; then
    case $2 in
      ls)
        _git_fzf_stash_list
        ;;
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
