#########################################
#		oh-my-zsh - custom: 005: aliases
# version: 1                 2025 Aug 08
#############################-###########

## moor
#####################################################################
if hasSoftware "moor"; then
    export PAGER="$(brew --prefix)/bin/moor"
fi
