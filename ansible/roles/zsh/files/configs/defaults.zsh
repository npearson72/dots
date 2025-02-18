# ZSH history
HISTSIZE=10000
SAVEHIST=10000

# Inserts commands from the history file into editing buffer (i.e. prompt) instead of executing them directly
setopt HIST_VERIFY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE

# Run background jobs at higher priority
setopt NO_BG_NICE

 # Does not send the HUP signal to running jobs when shell exits
setopt NO_HUP

 # Try to correct the spelling of commands
setopt CORRECT

 # Helps avoid mistakes like `rm * o` when `rm *.o` was intended
setopt RM_STAR_WAIT


setopt PROMPT_CR
