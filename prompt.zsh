# Modified from the ohmyzsh timer plugin
setopt prompt_subst

TIMER_PRECISION=3


timer_current_time() {
  zmodload zsh/datetime
  echo $EPOCHREALTIME
}


timer_format_duration() {
  local mins=$(printf '%.0f' $(($1 / 60)))
  local secs=$(printf "%.${TIMER_PRECISION:-1}f" $(($1 - 60 * mins)))
  local duration_str=$(echo "${mins}m${secs}s")
  local format="${TIMER_FORMAT:-%d}"
  echo "${format//\%d/${duration_str#0m}}"
}


timer_save_time_preexec() {
  timer_cmd_start_time=$(timer_current_time)
}


timer_display_timer_precmd() {
  if [ -n "${timer_cmd_start_time}" ]; then
    local cmd_end_time=$(timer_current_time)
    local tdiff=$((cmd_end_time - timer_cmd_start_time))
    unset timer_cmd_start_time

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

