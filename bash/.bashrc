source $HOME/.git-prompt.sh
source $HOME/.tr-prompt.sh

# export EDITOR='nvim'

LS_COLORS=$LS_COLORS:'di=0;93:'
export LS_COLORS

pathmunge () {
  if [ -d "$1" ]
  then
    if ! echo $PATH | /bin/egrep -q "(^|:)$1($|:)"
    then
      if [ "$2" = "after" ]
      then
        PATH=$PATH:$1
      else
        PATH=$1:$PATH
      fi
    fi
  fi
}

pathmunge "$HOME/bin" after
pathmunge "$HOME/bin/nvim" after
pathmunge "$HOME/bin/typst" after
# pathmunge "$HOME/Android/Sdk/emulator" after
# pathmunge "$HOME/.amplify/bin" after

unset pathmunge
