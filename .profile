# virtualenvwrapper hooks
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

export EDITOR=vim

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
alias ..="cd .. $@"
alias ls="ls -G $@"
alias ll="ls -l $@"
alias la="ls -a $@"
alias lla="ls -la $@"

function hidden() {
    ls -a $@ | grep -e "^\.";
}

# grep
export GREP_COLOR="1"
alias grep="grep --color $@"

# alias olark="cd /Volumes/olark-george/apps"
alias hiflii="cd /Users/gjcourt/Dropbox/projects/web/hiflii"
alias gjcourt="ssh root@gjcourt.com"
alias disqus="cd ~/projects/disqus/disqus && workon disqus"
alias disqus-prox="sudo haproxy -f ~/projects/disqus-ops/vagrant/local/haproxy/haproxy.cfg"
alias disqus-vag="cd ~/projects/disqus-ops/vagrant/local && vag ssh"

# Vagrant shortcuts
alias vag="vagrant $@"

# GIT aliases
# alias git-merge="git checkout $1 && git pull && git checkout $2 && git merge $1"

# Find
# alias find="find $@ -print 2>/dev/null"

# GeoIP fix
export GEOIP_ARCH='-arch i386 -arch x86_64 -arch ppc -arch ppc64'

# Django shell alias
alias shell="python manage.py shell"
alias git-stats="git fetch origin && git shortlog --all -sne $@"

# ssh aliases
alias addkeys='find ~/.ssh -name id_rsa -exec ssh-add {} \;'

export PATH=/usr/local/bin:/usr/local/sbin:$PATH

export PYTHONDONTWRITEBYTECODE=1

export ec2="ec2-107-20-59-35.compute-1.amazonaws.com"

# export SPY_BASE="/var/run/spy/"
export SPY_BASE="/usr/local/var/spy/"

alias django="export DJANGO_SETTINGS_MODULE='disqus.settings'"

# Java
export CLASSPATH=/usr/local/lib/java/*:/usr/local/lib/clojure/target/clojure.jar:$CLASSPATH

# Storm
export PATH=$HOME/projects/storm-0.7.0/bin:$PATH

# Clojure
export M2_PATH=$HOME/.m2
export CLOJURE_REPO=$M2_PATH/repository
export CLOJURE_LIBS=$M2_PATH/cheshire/cheshire/4.0.1-SNAPSHOT/cheshire-4.0.1-SNAPSHOT.jar:$M2_PATH/clj-http/clj-http/0.1.1/clj-http-0.1.1.jar:$M2_PATH/clj-ssh/clj-ssh/0.2.4/clj-ssh-0.2.4.jar:$M2_PATH/clj-time/clj-time/0.3.0/clj-time-0.3.0.jar:$CLOJURE_LIBS

