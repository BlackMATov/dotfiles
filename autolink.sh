#!/bin/bash
set -e
DIR="$( cd "$( dirname "${BASH_SOURCE}" )" && pwd )"

ln -f "${DIR}/.vimrc" "${HOME}/.vimrc"
ln -f "${DIR}/.zshrc" "${HOME}/.zshrc"
ln -f "${DIR}/htoprc" "${HOME}/htoprc"
