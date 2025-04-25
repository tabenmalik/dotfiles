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

# Binding the up and down arrow keys to searching history backwards
# and forwards, respectively. Sets the cursor at the end of the line.
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '\eOA' history-beginning-search-backward-end
bindkey '\eOB' history-beginning-search-forward-end

alias cp='cp -i'
alias mv='mv -i'
alias ls='ls --color=auto'
alias less='less -S'

export PROMPT="%- %# "

export PAGER="less -S --use-color"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/taben/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/taben/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/taben/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/taben/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

