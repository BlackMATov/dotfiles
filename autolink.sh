#!/bin/bash
set -e
DIR="$( cd "$( dirname "${BASH_SOURCE}" )" && pwd )"

ln -shf "${DIR}/.zshrc" "${HOME}/.zshrc"
ln -shf "${DIR}/htoprc" "${HOME}/htoprc"
ln -shf "${DIR}/nvim" "${HOME}/.config/nvim"
