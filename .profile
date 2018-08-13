# Path additions
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH

# Vim
export EDITOR=vim

# enable bash completion for git (git-core port told me to do this)
if [ -f /opt/local/etc/bash_completion ]; then
    source /opt/local/etc/bash_completion
fi

# define colors for special prompt
RED='\[\e[0;31m\]'
REDWARNING='\[\e[4;31m\]'
GREEN='\[\e[0;32m\]'
YELLOW='\[\e[1;33m\]'
ORANGE='\[\e[0;33m\]'
BLUE='\[\e[0;34m\]'
MAGENTA='\[\e[0;35m\]'
BGMAGENTA_FGWHITE='\[\e[0;45;37m\]'
MAGENTA_BOLD='\[\e[0;35;1m\]'
WHITE='\[\e[0;37m\]'
GREY='\[\e[0;30m\]'
BOLD='\[\e[1;1m\]'
NOCOLOR='\[\e[0m\]'

function colour {
    local colour=$1
    local code=""
    case $1 in
        "none" ) code="0";;
        "black" ) code="0;30";;
        "blackbold" ) code="1;30";;
        "red" ) code="0;31";;
        "redbold" ) code="1;31";;
        "green" ) code="0;32";;
        "greenbold" ) code="1;32";;
        "yellow" ) code="0;33";;
        "yellowbold" ) code="1;33";;
        "blue" ) code="0;34";;
        "lightblue" ) code="38;5;33";;
        "bluebold" ) code="1;34";;
        "purple" ) code="38;5;99";;
        "purplebold" ) code="1;35";;
        "cyan" ) code="0;36";;
        "cyanbold" ) code="1;36";;
        "white" ) code="0;37";;
        "whitebold" ) code="1;37";;
        "none" ) code="0";;
        *)
        echo "colour $1 not found!"
        exit 1
        ;;
    esac
    echo "\[\033[${code}m\]"
}

function prompt_func {
    export PS1="$(colour lightblue)\w $(colour green)$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1 /')$(colour purple)\$$(colour none) "
}

PROMPT_COMMAND='prompt_func'

# ls
alias ..="cd .. $@"
alias ls="ls -G $@"
alias ll="ls -l $@"
alias la="ls -a $@"
alias lla="ls -la $@"

function hidden() { ls -a $@ | grep -e "^\."; }
alias dot='hidden'

function swap()
{
    local TMPFILE=tmp.$$
    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}

# grep
export GREP_COLOR="1"
alias grep="grep --color $@"

# Source a local profile if it exists
if [ -f ~/.profile.local ]
then
    . ~/.profile.local
fi
