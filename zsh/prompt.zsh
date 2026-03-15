# Guard: only run in zsh
[[ -n $ZSH_VERSION ]] || return

setopt PROMPT_SUBST

autoload -Uz vcs_info add-zsh-hook
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '%b'

typeset -g GIT_FLAGS GIT_PROMPT PROMPT_SYMBOL
typeset -g PROMPT_FIRST_RUN=1

git_prompt_flags() {
    local line flags=""
    local index_status worktree_status
    local has_ahead=0
    local has_behind=0
    local has_staged=0
    local has_unstaged=0
    local has_untracked=0
    local has_deleted=0
    local has_renamed=0

    command git rev-parse --is-inside-work-tree &>/dev/null || return

    while IFS= read -r line; do
        if [[ $line == '## '* ]]; then
            [[ $line == *ahead* ]]  && has_ahead=1
            [[ $line == *behind* ]] && has_behind=1
            continue
        fi

        if [[ ${line[1,2]} == '??' ]]; then
            has_untracked=1
            continue
        fi

        index_status=${line[1,1]}
        worktree_status=${line[2,2]}

        [[ $index_status == [MADRCU] ]] && has_staged=1
        [[ $worktree_status != ' ' ]] && has_unstaged=1

        [[ $index_status == 'D' || $worktree_status == 'D' ]] && has_deleted=1
        [[ $index_status == 'R' || $worktree_status == 'R' ]] && has_renamed=1
    done < <(command git status --porcelain=1 --branch 2>/dev/null)

    (( has_ahead     )) && flags+="↑"
    (( has_behind    )) && flags+="↓"
    (( has_staged    )) && flags+="+"
    (( has_unstaged  )) && flags+="!"
    (( has_untracked )) && flags+="?"
    (( has_deleted   )) && flags+="x"
    (( has_renamed   )) && flags+=">"

    print -r -- "$flags"
}

update_prompt_state() {
    vcs_info
    GIT_FLAGS=$(git_prompt_flags)

    if [[ -n $vcs_info_msg_0_ ]]; then
        GIT_PROMPT="[${vcs_info_msg_0_}${GIT_FLAGS}]"
    else
        GIT_PROMPT=""
    fi
}

prompt_blank_line() {
    if (( PROMPT_FIRST_RUN )); then
        PROMPT_FIRST_RUN=0
    else
        print
    fi
}

add-zsh-hook precmd update_prompt_state
add-zsh-hook precmd prompt_blank_line

if [[ $EUID -eq 0 ]]; then
    PROMPT_SYMBOL="⚠"
else
    PROMPT_SYMBOL="➜"
fi

PROMPT='%F{red}%n%f@%F{cyan}%m%f:%F{green}%~%f %F{magenta}${GIT_PROMPT}%f
${PROMPT_SYMBOL} '