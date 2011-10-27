# virtualenvwrapper hooks
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# enable bash completion for git (git-core port told me to do this)
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
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
function show_special_prompt {
export PS1="${BOLD}\w ${MAGENTA_BOLD}$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1 /')${NOCOLOR}${BOLD}>${NOCOLOR} "
}
PROMPT_COMMAND='show_special_prompt'

# ls
alias ..="cd .."
alias ls="ls -G $@"
alias ll="ll -l"
alias lsla="lsla -la"
alias lsa="la -a"

# grep
export GREP_COLOR="1"
alias grep="grep --color $@"

# alias olark="cd /Volumes/olark-george/apps"
alias hiflii="cd /Users/gjcourt/Dropbox/projects/web/hiflii"
# alias gjcourt="ssh gjcourt.com@s77779.gridserver.com"
alias gjcourt="ssh root@gjcourt.com"
alias disqus="cd ~/projects/disqus/disqus && workon disqus"
alias disqus-vag="cd ~/projects/disqus-ops/vagrant/dev"
alias disqus-prox="sudo haproxy -f /usr/local/etc/haproxy/haproxy.conf"

# Vagrant shortcuts
alias vup="vagrant up"
alias vhalt="vagrant halt"
alias vssh="vagrant ssh"
alias vupdate="vagrant provision"
alias vrestart="vagrant halt && vagrant up"

# Find
alias find="find $@ -print 2>/dev/null"

# GeoIP fix
export GEOIP_ARCH='-arch i386 -arch x86_64 -arch ppc -arch ppc64'

# Django shell alias
alias shell="python manage.py shell"
alias git-stats="git fetch origin && git shortlog --all -sne $@"

export PATH=/usr/local/bin:/usr/local/sbin:$PATH

export PYTHONDONTWRITEBYTECODE=0
