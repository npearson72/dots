AGKOZAK_CUSTOM_SYMBOLS=(
  '%F{yellow}▾%f%F{green}▴%f' # Diverged
  '%F{yellow}▾%f'             # Behind
  '%F{green}▴%f'              # Ahead
  '%F{green}+%f'              # Staged
  '%F{yellow}-%f'             # Deleted
  '%F{yellow}!%f'             # Modified
  '%F{yellow}~%f'             # Renamed
  '%F{yellow}+%f'             # Unstaged
)

# Username and hostname
AGKOZAK_CUSTOM_PROMPT='%(!.%S%B.%F{green})%n%1v%(!.%b%s.%f%b) '
# Path
AGKOZAK_CUSTOM_PROMPT+='%F{blue}%2v%f%b'
# Virtual environment
AGKOZAK_CUSTOM_PROMPT+='%(10V. %F{green}[%10v]%f.)'
# Background jobs indicator and newline
AGKOZAK_CUSTOM_PROMPT+='%(1j. %F{magenta}%jj%f.)'
# Git status and newline
AGKOZAK_CUSTOM_PROMPT+=$' %(3V.%F{243}(%6v%f%(7V. ${psvar[7]}.)%F{243}%)%f.)\n'
# Prompt character
AGKOZAK_CUSTOM_PROMPT+='%F{blue}➜%f '

AGKOZAK_LEFT_PROMPT_ONLY=1
AGKOZAK_SHOW_STASH=0
