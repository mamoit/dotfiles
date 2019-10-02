# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# BASH Aliases
alias ll='ls -l'
alias l='ls -l'
alias lh='ls -lh'
alias la='ls -la'
alias lt='ls -lt'
alias lth='ls -lth'
alias lat='ls -lat'
alias ltr='ls -ltr'
alias ltrh='ls -ltrh'
alias latr='ls -latr'

# GIT Aliases
alias g='git'
alias gr='git rev-parse --show-toplevel > /dev/null && cd $(git rev-parse --show-toplevel)'
alias co='git checkout'
alias ci='git commit'
alias st='git status'
alias br='git branch'
alias d='git diff'
alias dp='git diff --patience'
alias padd='git add -p'

# Docker stuff
alias centos='docker run --rm -it centos bash'
alias centos-7='docker run --rm -it centos:7 bash'

alias ubuntu='docker run --rm -it ubuntu bash'

# K8s stuff
alias k='kubectl'

