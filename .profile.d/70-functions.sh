# List hidden files, excluding . and ..
function hidden() { ls -a "$@" | grep -E "^\." | grep -vE "^\.{1,2}$"; }
alias dot='hidden'

# Swap two files
function swap() {
    local TMPFILE=tmp.$$
    mv "$1" "$TMPFILE"
    mv "$2" "$1"
    mv "$TMPFILE" "$2"
}
