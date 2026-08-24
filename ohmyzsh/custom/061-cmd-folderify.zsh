#########################################
#		oh-my-zsh - custom: 005: aliases
# version: 1                 2025 Aug 08
#############################-###########

## command
# folderify
#####################################################################
if hasSoftware "folderify"; then
  source <(folderify --completions zsh)
fi
