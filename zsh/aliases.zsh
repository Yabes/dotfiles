# ======= MOTHER FUCKING ALIAS =======
# - LS -
alias ls="ls -G"
alias l="ls"
alias ll="ls -lh"
alias la="ls -a"
alias l.='ls -d .*'
alias llol="ls -l | lolcat"

# - Screen -
alias sc="screen -S"
alias sl="screen -ls"
alias sr="screen -r"
alias sMemo="echo -e 'sc: create with name\nsl: list\nsr: reattach\nctrl+a d: detach'"

# - Bad Typing -
alias xs="cd"
alias vf="cd"
alias car="cat"

# - Short -
alias p="pwd"
alias c="clear"
alias cls="clear"
alias mv="mv -i"
alias rm="rm -i"
alias ..="cd .."

# - Apt -
alias aga='sudo apt-get autoclean' # aac
alias agb='sudo apt-get build-dep' # abd
alias agc='sudo apt-get clean'     # adc
alias agd='sudo apt-get dselect-upgrade' # ads
alias agi='sudo apt-get install'  # ai
alias agp='sudo apt-get purge'    # ap
alias agr='sudo apt-get remove'   # ar
alias agu='sudo apt-get update'   # ad
alias agud='sudo apt-get update && sudo apt-get dist-upgrade' #adu
alias agug='sudo apt-get upgrade' # ag
alias aguu='sudo apt-get update && sudo apt-get upgrade'      #adg

# - Fun stuff -
alias grep="grep --color"
alias cafe="cat /dev/urandom | hexdump -C | grep 'ca fe'"

# - Vagrant -
alias vv="vagrant up && vagrant ssh"
alias vh="vagrant halt"

# - GVim -
#Discard error
alias gvim="gvim 2>/dev/null"

