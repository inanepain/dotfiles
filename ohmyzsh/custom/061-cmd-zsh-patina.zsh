#########################################
#		oh-my-zsh - custom: 005: aliases
# version: 1                 2025 Aug 08
#############################-###########

## command
# zsh-patina
#####################################################################
if hasSoftware "brew"; then
	if [[ -f $(brew --prefix)/opt/zsh-patina/bin/zsh-patina ]]; then
		eval "$($(brew --prefix)/opt/zsh-patina/bin/zsh-patina activate)"
	fi
elif [[ -f ~/.cargo/bin/zsh-patina ]]; then
	eval "$(~/.cargo/bin/zsh-patina activate)"
fi
