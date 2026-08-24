#########################################
#		oh-my-zsh - custom: 005: aliases
# version: 1                 2025 Aug 08
#############################-###########

## command
# hurl
#####################################################################
if hasSoftware "hurl"; then
  compctl -/g '*.http' hurl
fi
