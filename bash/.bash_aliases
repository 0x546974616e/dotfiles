alias hexedit="hexedit --color"
alias rm='rm -i'
alias ls='ls -F --color=auto'
alias la='ls -A'
alias l='ls -l'
alias lb='ls -lB'
alias ll='ls -al'
alias lf='ls -l | sort -rf'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias pst='ps -f -u $USER'
alias bat='upower -i $(upower -e | grep BAT) | grep -E "state|to\ full|to\ empty|percentage" --color=never'
alias c="cargo"
