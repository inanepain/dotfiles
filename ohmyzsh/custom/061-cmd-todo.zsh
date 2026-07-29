#########################################
#		oh-my-zsh - custom: 005: aliases
# version: 1                 2025 Aug 08
#############################-###########

## command
# todo.sh
#####################################################################
export TODOTXT_DEFAULT_ACTION=ls
export TODOTXT_SORT_COMMAND='env LC_COLLATE=C sort -k 2,2 -k 1,1n'

if which pter >/dev/null; then
    alias todo.ui="pter ~/Documents/ToDo/todo.txt"
fi

if which topydo >/dev/null; then
    alias topydo="topydo -t /Users/philip/Documents/ToDo/todo.txt"
fi

todo=~/Documents/ToDo
: ~todo
