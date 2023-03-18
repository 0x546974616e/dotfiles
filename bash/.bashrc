
source ~/.git-prompt.sh
source ~/.tr-prompt.sh

       LS_COLORS=$LS_COLORS:'di=0;93:'
export LS_COLORS

pathmunge ()
{
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

# Set PATH so it includes user's private bin if it exists
pathmunge "$HOME/.local/bin" after

unset pathmunge

