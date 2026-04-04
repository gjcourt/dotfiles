# Define ANSI color variables
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
        *)
        echo "colour $1 not found!"
        exit 1
        ;;
    esac
    echo "\[\033[${code}m\]"
}
