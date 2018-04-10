# --- control ls command output ---
alias ls='ls --color=auto'

# --- control grep command output ---
alias grep='grep --color=auto'

# --- create parent directories on demand ---
alias mkdir='mkdir -pv'

# --- set vim as default ---
alias vi='vim'
alias edit='vim'

# --- system commands ---
alias df='df -H'
alias du='du -ch'

# --- formatters ---
alias json='python -m json.tool'
alias xml='xmllint --format -'

# --- git aliases ---
alias gitlog='git log --graph --pretty=tformat:"%Cred%h%Creset (%Cgreen%cd%Creset, %C(bold blue)%an%Creset): %s%C(yellow)%d%Creset" --date=format:"%Y-%m-%d %H:%M" --abbrev-commit'

