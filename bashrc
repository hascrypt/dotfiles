#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias vim="nvim"
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias nc="ncmpcpp"
alias gpg-tui="gpg-tui -s colored"
alias tn="tmux -u -f $TMUX_CONFIG new"
alias ta="tmux -u -f $TMUX_CONFIG attach"
alias jn="jupyter notebook"

if [[ $EUID -ne 0 ]]; then
    PS1='[\[\033[01;32m\]\u\[\033[0m\]\[\033[02;38m\]@\h\[\033[0m\] \W]\$ '
else
    PS1='[\[\033[01;31m\]\u\[\033[0m\]\[\033[02;38m\]@\h\[\033[0m\] \W]\$ '
fi

export HISTFILESIZE=1000000
export HISTSIZE=1000000

source /usr/share/fzf/completion.bash
source /usr/share/fzf/key-bindings.bash

# pk() process kill
pk() {
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
 
  if [ "x$pid" != "x" ]
  then
    kill -${1:-9} $pid
  fi
}
