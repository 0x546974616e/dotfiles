alias rm='rm -i'
alias cp='cp -v'

alias ls='ls -F --color=auto'
alias la='ls -A'
alias l='ls -l'
alias lb='ls -lB'
alias ll='ls -al'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias pst='ps -f -u $USER'
alias bat="batcat --pager never"
alias batt='upower -i $(upower -e | grep BAT) | grep -E "state|to\ full|to\ empty|percentage" --color=never'
alias hexedit="hexedit --color"
alias c="cargo"

