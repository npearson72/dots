#!/bin/sh

# Required settings
setopt PROMPT_SUBST # Turns on parameter expansion, command substitution and arithmetic expansion in prompts
autoload colors && colors

# Git functions
if (( $+commands[git] ))
then
  git="$commands[git]"
else
  git="/usr/bin/git"
fi

git_branch() {
  echo $($git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
  if $(! $git status -s &> /dev/null)
  then
    echo ""
  else
    if [[ $($git status --porcelain) == "" ]]
    then
      echo "on %{$fg[green]%}$(git_prompt_info)%{$reset_color%}"
    else
      echo "on %{$fg[red]%}$(git_prompt_info)%{$reset_color%}"
    fi
  fi
}

git_prompt_info () {
  ref=$($git symbolic-ref HEAD 2>/dev/null) || return
  echo "${ref#refs/heads/}"
}

unpushed () {
  $git cherry -v @{upstream} 2>/dev/null
}

need_push () {
  if [[ $(unpushed) == "" ]]
  then
    echo " "
  else
    echo " with %{$fg[magenta]%}unpushed%{$reset_color%} "
  fi
}

# Other functions
user_and_host() {
  echo "%{$fg[green]%}$USER@$HOST%{$reset_color%} "
}

directory_name() {
  echo "%{$fg[blue]%}%d%{$reset_color%}"
}

# Prompts
export PROMPT=$'\n$(user_and_host)in $(directory_name) $(git_dirty)$(need_push)\n› '
export RPROMPT=""
