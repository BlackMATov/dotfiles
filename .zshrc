export LANG="en_US.UTF-8"

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh

alias mc="mc --nosubshell"

if type brew &>/dev/null; then
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    autoload -Uz compinit && compinit
fi
