#########################################
#		oh-my-zsh - custom: 005: aliases
# version: 1                 2025 Aug 08
#############################-###########

## command
# gt
#####################################################################
if hasSoftware "gt"; then
  autoload -U compinit && compinit
  source <(gt completion zsh)
fi
