git_fzf_show() {
  git log --graph --color=always \
      --format="%Cred%h%Creset - %s%C(yellow)%d%Creset %Cgreen(%cr) %C(bold blue)<%an>%Creset" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {} FZF-EOF"
}

# Git overwrites
git() {
    if [ "$1" = "add" ] && [ -z "$2" ] # git add using fzf
    then
        command git add $(git ls-files -m -o --exclude-standard | fzf -m)
    elif [ "$1" = "rm" ] && [ -z "$2" ] # git rm using fzf
    then
        command git rm $(git ls-files -d --exclude-standard | fzf -m)
    elif [ "$1" = "reset" ] && [ -z "$2" ] # git reset using fzf
    then
        command git diff --name-only --cached | fzf -m | xargs -I {} sh -c 'git reset -- $0' {} > /dev/null 2>&1
    elif [ "$1" = "show" ] && [ "$2" -eq 0 ] # git commit browser
    then
        git_fzf_show
    else
        command git $@
    fi;
}
