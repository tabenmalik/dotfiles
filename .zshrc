path=("$HOME/bin" "/usr/games/" $path)
export PATH

setopt interactivecomments

#--------------------------------------------------------------------------------------------------
# History
#
# Intending to keep a large history that can be quickly searched with a starting string and using
# the up/down arrow keys. The options `extended_history` and `inc_append_history_time` allow
# recording runtimes of commands. Runtime in the history is preferable over runtime in the prompt
# to reduce clutter of the prompt and maintain a record of the runtime.
HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh/zsh_history"
HISTFILESIZE=1000000
HISTSIZE=1000000
SAVEHIST=1000000
setopt extended_history
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt inc_append_history_time
bindkey "^[OA" history-beginning-search-backward
bindkey "^[OB" history-beginning-search-forward
# Outputs ISO time stamps and runtimes in history output.
# Use `history -r 1` to list all history in reverse order.
alias history="fc -liD"

#--------------------------------------------------------------------------------------------------
# Color
alias less="less --use-color"
alias ls="ls --color=auto"

# Coloring man pages
autoload -Uz colors
colors
# bold & blinking mode
export LESS_TERMCAP_mb="${fg_bold[yellow]}"
export LESS_TERMCAP_md="${fg_bold[yellow]}"
export LESS_TERMCAP_me="${reset_color}"
# standout mode
export LESS_TERMCAP_so="${fg_bold[yellow]}${bg[blue]}"
export LESS_TERMCAP_se="${reset_color}"
# underlining
export LESS_TERMCAP_us="${fg_bold[green]}"
export LESS_TERMCAP_ue="${reset_color}"


#plugins=(git colorize common-aliases docker docker-compose emoji fancy-ctrl-z git-prompt isodate perms pip python ssh themes)

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
