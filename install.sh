#!/usr/bin/bash

TR_INSTALL_SRC=$(dirname "$0")
TR_INSTALL_DST=
#$HOME

TR_INSTALL_VERBOSE=0
TR_INSTALL_FAKE=0
TR_INSTALL_PROMPT=0
TR_INSTALL_ALL=0
TR_INSTALL_MODE='-o'

TR_CONFIG=( 'bash' 'gdb' 'tmux' 'vim' )

tr_usage ()
{
    echo 'Usage:' $(basename "$0") '[OPTION...] [TR_CONFIG...]'
    echo 'Install package configuration files.'
    echo
    echo OPTION
    echo '  -V  Verbose mode'
    echo '  -q  Quiet mode'
    echo '  -t  Fake mode'
    echo '  -i  Prompt confirmation'
    echo '  -f  Do not prompt confirmation'
    echo '  -a  Install all available packages'
    echo '  -o  Install only given packages (default)'
    echo '  -v  Install all packages except given ones'
    echo '  -s  Source directory'
    echo '  -d  Home directory'
    echo '  -h  Display help'
    echo
    echo TR_CONFIG
    echo '  Avalaible packages:'
    echo "${TR_CONFIG[@]}" | sed -E 's/(\w+)\s*/    \1\n/g'
    exit 1
}

while getopts ':Vqtifaovs:d:h' arg
do
    case "$arg" in
        V) TR_INSTALL_VERBOSE=1 ;;
        q) TR_INSTALL_VERBOSE=0 ;;
        t) TR_INSTALL_FAKE=1    ;;
        i) TR_INSTALL_PROMPT=1  ;;
        f) TR_INSTALL_PROMPT=0  ;;
        a) TR_INSTALL_ALL=1     ;;
        o) TR_INSTALL_MODE='-o' ;;
        v) TR_INSTALL_MODE='-v' ;;
        s) TR_INSTALL_SRC="$OPTARG" ;;
        d) TR_INSTALL_DST="$OPTARG" ;;
        h) tr_usage ;;
    esac
done

if [ ! -d "$TR_INSTALL_SRC" ] || [ ! -d "$TR_INSTALL_DST" ]
then
    tr_usage
fi

shift $((OPTIND-1))

tr_install_log ()
{
    if [ $TR_INSTALL_VERBOSE == 1 ]
    then
        echo "$@"
    fi
}

tr_install_append_file ()
{
    local src="$TR_INSTALL_SRC/$1"
    local dst="$TR_INSTALL_DST/$2"

    tr_install_log Adding "'$src' to '$dst'."

    if [ $TR_INSTALL_FAKE -eq 0  ]
    then
        mkdir -p $(dirname "$dst")
        /usr/bin/cat "$src" >> "$dst"
    fi
}

tr_install_write_file ()
{
    local src="$TR_INSTALL_SRC/$1"
    local dst="$TR_INSTALL_DST/$2"

    tr_install_log Copying "'$src' to '$dst'."

    if [ $TR_INSTALL_FAKE -eq 0  ]
    then
        mkdir -p $(dirname "$dst")
        /usr/bin/cp "$src" "$dst"
    fi
}

################################################################################
# BASH                                                                         #
################################################################################

tr_install_bash ()
{
    tr_install_log Installing '`bash`.'

    tr_install_write_file  bash/.bash_aliases  .bash_aliases
    tr_install_append_file bash/.bashrc        .bashrc
    tr_install_write_file  bash/.tr-prompt.sh  .tr-prompt.sh
    tr_install_write_file  bash/.git-prompt.sh .git-prompt.sh
}

################################################################################
# GDB                                                                          #
################################################################################

tr_install_gdb ()
{
    tr_install_log Installing '`gdb`.'

    tr_install_write_file gdb/.gdbinit .gdbinit
}

################################################################################
# TMUX                                                                         #
################################################################################

tr_install_tmux ()
{
    tr_install_log Installing '`tmux`.'

    tr_install_write_file tmux/.tmux.conf .tmux.conf
}

################################################################################
# VIM                                                                          #
################################################################################

tr_install_vim ()
{
    tr_install_log Installing '`vim`.'

    local colortheme='base16-tomorrow-night-eighties.vim'

    tr_install_write_file vim/.vimrc             .vimrc
    tr_install_write_file vim/colors/$colortheme .vim/colors/$colortheme
}

if [ $TR_INSTALL_ALL -ne 1 ]
then
    TR_CONFIG=( $(echo "${TR_CONFIG[@]}" | tr ' ' '\n' | grep -E $TR_INSTALL_MODE "^($(echo "$@" | tr ' ' '|'))$" ) )
fi

for config in "${TR_CONFIG[@]}"
do
    if [ $TR_INSTALL_PROMPT -eq 1 ]
    then
        read -p "Confirm \`$config\` dotfiles installation [Y/n]? " -n 1 -r
        echo

        if [ "$REPLY" != 'y' ] && [ "$REPLY" != 'Y' ]
        then
            continue
        fi
    fi

    case "$config" in
        bash) tr_install_bash ;;
        gdb)  tr_install_gdb  ;;
        tmux) tr_install_tmux ;;
        vim)  tr_install_vim  ;;
    esac
done

