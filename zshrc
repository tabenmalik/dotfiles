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

zmodload zsh/datetime


# Modified from the ohmyzsh timer plugin
setopt prompt_subst

TIMER_PRECISION=3

__timer_current_time() {
  zmodload zsh/datetime
  echo $EPOCHREALTIME
}

__timer_format_duration() {
  local mins=$(printf '%.0f' $(($1 / 60)))
  local secs=$(printf "%.${TIMER_PRECISION:-1}f" $(($1 - 60 * mins)))
  local duration_str=$(echo "${mins}m${secs}s")
  local format="${TIMER_FORMAT:-/%d}"
  echo "${format//\%d/${duration_str#0m}}"
}

__timer_save_time_preexec() {
  __timer_cmd_start_time=$(__timer_current_time)
}

__timer_display_timer_precmd() {
  if [ -n "${__timer_cmd_start_time}" ]; then
    local cmd_end_time=$(__timer_current_time)
    local tdiff=$((cmd_end_time - __timer_cmd_start_time))
    unset __timer_cmd_start_time
    if [[ -z "${TIMER_THRESHOLD}" || ${tdiff} -ge "${TIMER_THRESHOLD}" ]]; then
        tdiffstr=$(__timer_format_duration ${tdiff})
        local cols=$((COLUMNS - ${#tdiffstr} - 1))
        #echo -e "\033[1A\033[${cols}C ${fg[cyan]}${tdiffstr}${none}"
        RPROMPT='%F{cyan}${tdiffstr}%F{none}'
    fi
  else
    unset tdiffstr
  fi
}

autoload -U add-zsh-hook
add-zsh-hook preexec __timer_save_time_preexec
add-zsh-hook precmd __timer_display_timer_precmd
