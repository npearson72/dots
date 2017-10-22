# http://zsh.sourceforge.net/Doc/Release/Options.html

# ZSH history
HISTFILE=$HOME/.local/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt HIST_VERIFY # Inserts commands from the history file into editing buffer (i.e. prompt) instead of executing them directly
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS

# General
setopt NO_BG_NICE # Run background jobs at higher priority
setopt NO_HUP # Does not send the HUP signal to running jobs when shell exits
setopt CORRECT # Try to correct the spelling of commands
setopt RM_STAR_WAIT # Helps avoid mistakes like `rm * o` when `rm *.o` was intended

# Key bindings
bindkey -e # Emacs key bindings for ZSH
