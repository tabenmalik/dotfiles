#!/usr/bin/env bash
#
# Inspired by holman's dotfile installer
# https://github.com/holman/dotfiles

# Determine root folder of dotfiles
cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

echo $DOTFILES_ROOT

# Exit the script if a command returns a non-zero status
set -e

# Colored Message Functions
info () {
    printf "\r [ \033[0;34m..\033[0m ] $1\n"
}

user () {
    printf "\r [ \033[0;33m??\033[0m ] $1\n"
}

success () {
    printf "\r\033[2K [ \033[0;32mOK\033[0m ] $1\n"
}

fail () {
    printf "\r\033[2K [ \033[0;31mFAIL\033[0m ] $1\n"
    echo ""
    exit
}

info "info"
user "user"
success "success"
fail "FAIL"
