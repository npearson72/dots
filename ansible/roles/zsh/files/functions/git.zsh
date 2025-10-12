#!/bin/sh

_git_print_legend() {
cat << EOF
${(%):-%F{243\}}Diverged ${(%):-%f} ${(%):-%F{yellow\}}▾${(%):-%f}${(%):-%F{green\}}▴${(%):-%f}
${(%):-%F{243\}}Behind   ${(%):-%f} ${(%):-%F{yellow\}}▾${(%):-%f}
${(%):-%F{243\}}Ahead    ${(%):-%f} ${(%):-%F{green\}}▴${(%):-%f}
${(%):-%F{243\}}Staged   ${(%):-%f} ${(%):-%F{green\}}+${(%):-%f}
${(%):-%F{243\}}Deleted  ${(%):-%f} ${(%):-%F{yellow\}}-${(%):-%f}
${(%):-%F{243\}}Modified ${(%):-%f} ${(%):-%F{yellow\}}!${(%):-%f}
${(%):-%F{243\}}Renamed  ${(%):-%f} ${(%):-%F{yellow\}}~${(%):-%f}
${(%):-%F{243\}}Unstaged ${(%):-%f} ${(%):-%F{yellow\}}+${(%):-%f}
EOF
}

_git_fzf_add() {
  command git ls-files -m -o --exclude-standard | fzf -m | xargs git add
}

_git_fzf_rm() {
  command git ls-files -m -o --exclude-standard | fzf -m | xargs git rm
}

_git_fzf_reset() {
  command git diff --name-only --cached | fzf -m | xargs git reset --
}

_git_fzf_checkout_branch() {
  command git branch | grep -v '^*' | fzf | xargs git checkout
}

_fzf_for_log() {
  command fzf\
    --ansi\
    --no-sort\
    --tiebreak=index\
    --header "<enter> view commit | <ctrl-p> toggle preview window | <ctrl-s> sort | <esc> quit"\
    --preview "echo {} | grep -o '[a-f0-9]\{7\}' | head -1 | xargs git show --color=always | diff-so-fancy"\
    --preview-window "hidden"\
    --bind "ctrl-s:toggle-sort"\
    --bind "ctrl-p:toggle-preview"\
    --bind "up:preview-up,down:preview-down,shift-up:preview-page-up,shift-down:preview-page-down"\
    --bind "enter:execute: (grep -o '[a-f0-9]\{7\}' | head -1 | xargs git show --color=always | diff-so-fancy | less -R) <<-FZF-EOF
  {}
  FZF-EOF"
}

_git_fzf_log() {
  command git log\
    --color=always\
    --pretty=format:'%Cred%h%Creset - %s%C(yellow)%d%Creset %Cgreen(%cr) %C(bold blue)<%an>%Creset' $@ | _fzf_for_log
}


_git_fzf_stash_list() {
  command git stash list\
    --color=always\
    --pretty=format:'%Cred%gd%Creset - %s%C(yellow)%d%Creset %Cgreen(%cr) %C(bold blue)' |\
  fzf\
    --exit-0\
    --ansi\
    --no-sort\
    --tiebreak=index\
    --header "<enter> view stash | <alt-enter> apply stash | <alt-d> drop stash | <ctrl-p> toggle preview window | <ctrl-s> sort | <esc> quit"\
    --preview "echo {} | grep -o 'stash@{[0-9]}' | head -1 | xargs git stash show -p --color=always | diff-so-fancy"\
    --preview-window "hidden"\
    --bind "ctrl-p:toggle-preview"\
    --bind "ctrl-s:toggle-sort"\
    --bind "up:preview-up,down:preview-down,shift-up:preview-page-up,shift-down:preview-page-down"\
    --bind "alt-d:execute(echo {} | grep -o 'stash@{[0-9]}' | xargs git stash drop)+abort"\
    --bind "alt-enter:execute(echo {} | grep -o 'stash@{[0-9]}' | xargs git stash apply)+abort"\
    --bind "enter:execute: (grep -o 'stash@{[0-9]}' | xargs git stash show --color=always | diff-so-fancy | less -R) <<-FZF-EOF
  {}
  FZF-EOF"
}

_git_fzf_stash_apply() {
  if [[ $(git stash list | wc -l) -gt 1 ]]; then
    _git_fzf_stash_list
  else
    command git stash apply stash@{0}
  fi
}

git() {
  if [[ $1 = lg ]]; then
    _git_fzf_log ${@:2}
  elif [[ $1 = stash ]] && [[ -z $3 ]]; then
    case $2 in
      ls)
        _git_fzf_stash_list
        ;;
      apply)
        _git_fzf_stash_apply
        ;;
      *)
        command git $@
        ;;
    esac
  elif [[ -z $2 ]]; then
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
      co)
        _git_fzf_checkout_branch
        ;;
      legend)
        _git_print_legend
        ;;
      *)
        command git $@
        ;;
    esac
  else
    command git $@
  fi
}
