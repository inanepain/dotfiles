#########################################
#		oh-my-zsh - custom: 005: aliases
# version: 1                 2025 Aug 08
#############################-###########

## command
# atuin
#####################################################################
if hasSoftware "atuin"; then
  eval "$(atuin init zsh)"
fi
