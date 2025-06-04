alias cp='cp -vi'
alias mv='mv -vi'
alias rm='rm -vi'

alias ls='ls -F --color=auto'
alias lt='ls -GAhltr'
alias la='ls -A'
alias lb='ls -lB'
alias ll='ls -la'
alias l='ls -l'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias pst='ps -f -u $USER'
alias bat="batcat --pager never"
alias batt='upower -i $(upower -e | grep BAT) | grep -E "state|to\ full|to\ empty|percentage" --color=never'
alias hexedit="hexedit --color"
alias c="cargo"
alias g="git"

# See terminal hyperlinks (a.k.a., OSC 8)
# https://en.wikipedia.org/wiki/ANSI_escape_code#OSC_(Operating_System_Command)_sequences
# https://gist.github.com/egmontkob/eb114294efbcd5adb1944c9f3cb5feda
# https://github.com/Alhadis/OSC8-Adoption
# See issue with xclip: https://github.com/kovidgoyal/kitty/issues/828
alias cargodoccopy="cargo doc --color always 2>&1 | tee >(sed -nE 's/^.*Generated.*\\\\(\\/.*\.html).*$/\1/p' | tr -d '[[:space:]]' | xclip -r -selection clipboard 1> /dev/null 2> /dev/null)"

