# Keep a large history around since I am forgetful and lazy
HISTFILE=~/.histfile
HISTSIZE=10000000
SAVEHIST=10000000

# man zshoptions
# extendedglob: Treat #, ~, ^ characters as part of filename patterns
# nomatch: error if glob does not match any files
# interactivecomments: allows comments in interactive shell.
setopt extendedglob nomatch interactivecomments

# autocd: auto cd if command is name of directory
# beep: beep on error. I loathe beeps.
# notify: report status of background jobs immediately.
#   I am on the fence about turning this off
unsetopt autocd beep notify

# I know vim better but I don't think modal is the way to go for a terminal
bindkey -e

# The following lines were added by compinstall
zstyle :compinstall filename '/home/taben/.zshrc'

autoload -U compinit && compinit
bindkey '\eOA' history-beginning-search-backward
bindkey '\eOB' history-beginning-search-forward

alias cp='cp -i'
alias mv='mv -i'
