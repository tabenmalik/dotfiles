#!/usr/bin/env bash
# the not pipx installer
function xpip() {
    name=$1
    venvs=${XDG_DATA_HOME:-"${HOME}/.local/share"}/venvs
    mkdir -p $venvs
    virtualenv "${venvs}/${name}"
    "${venvs}/${name}"/bin/pip install --upgrade pip "${name}"
    ln -sf "${venvs}/${name}/bin/${name}" "${HOME}/.local/bin/${name}"
}

xpip pre-commit

cp -f ./.zshrc "${HOME}/.zshrc"
