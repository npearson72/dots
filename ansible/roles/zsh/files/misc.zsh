# Autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# Rbenv
if which rbenv >/dev/null; then
  eval "$(rbenv init -)"
fi
