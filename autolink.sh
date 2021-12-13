#!/bin/bash
set -e
DIR="$( cd "$( dirname "${BASH_SOURCE}" )" && pwd )"

ln -f "${DIR}/.vimrc" "${HOME}/.vimrc"
