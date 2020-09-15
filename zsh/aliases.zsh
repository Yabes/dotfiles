# ls
if [ "$(uname)" == "Darwin" ]; then
  alias ls="ls -G"
else
  alias ls="ls --color"
fi

alias l="ls"
alias ll="ls -lh"
alias la="ls -a"
alias l.='ls -d .*'

# Better defaults
alias mv="mv -i"
alias rm="rm -i"
alias grep="grep --color"
alias rg="rg --no-heading"

# Screen
alias sc="screen -S"
alias sl="screen -ls"
alias sr="screen -r"
alias sMemo="echo -e 'sc: create with name\nsl: list\nsr: reattach\nctrl+a d: detach'"

# Typos
alias xs="cd"
alias vf="cd"
alias car="cat"

# Short
alias ..="cd .."

# Vagrant
alias vv="vagrant up && vagrant ssh"
alias vh="vagrant halt"
alias vs="vagrant ssh"

# GVim
#Discard error
alias gvim="gvim 2>/dev/null"

alias tmux='tmux-select'
alias fg='\fg %$(jobs | grep -v pwd | sort -r | fzf --exit-0 --select-1 | cut -d [ -f2 | cut -d  ] -f1)'

