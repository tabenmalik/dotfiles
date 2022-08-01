#[ -n "$PS1" ] && source ~/.bash_profile

# Eternal bash history
# Save history eternally, with timestamps, while ignoring duplicate commands 
# or commands with a space at the beginning.
HISTSIZE=-1
HISTTIMEFORMAT="[%F %T] "
HISTCONTROL="ignorespace;ignoredups"
HISTFILESIZE=-1

# Append to history file instead of overwriting it 
shopt -s histappend
