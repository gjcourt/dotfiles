# Prompt with lazily-evaluated git branch
# Color sequences are pre-computed once at load time rather than on every prompt.
_PROMPT_LIGHTBLUE="$(colour lightblue)"
_PROMPT_GREEN="$(colour green)"
_PROMPT_PURPLE="$(colour purple)"
_PROMPT_NONE="$(colour none)"

# Cache the current branch and the directory it was resolved in so that git is
# only invoked when the working directory actually changes.
_git_branch_cache=""
_git_branch_dir=""

function _git_current_branch {
    if [ "$PWD" != "$_git_branch_dir" ]; then
        _git_branch_dir="$PWD"
        _git_branch_cache="$(git symbolic-ref --short HEAD 2>/dev/null)"
    fi
    echo "$_git_branch_cache"
}

function prompt_func {
    local branch
    branch="$(_git_current_branch)"
    local branch_str=""
    [ -n "$branch" ] && branch_str="${_PROMPT_GREEN}${branch} "
    PS1="${_PROMPT_LIGHTBLUE}\w ${branch_str}${_PROMPT_PURPLE}\$${_PROMPT_NONE} "
}

PROMPT_COMMAND='prompt_func'
