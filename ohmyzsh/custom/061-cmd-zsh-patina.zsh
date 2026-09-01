#########################################
#		oh-my-zsh - custom: 005: aliases
# version: 1                 2025 Aug 08
#############################-###########

## command
# zsh-patina
#####################################################################
if hasSoftware "brew"; then
	if [[ -f "$HOMEBREW_PREFIX/opt/zsh-patina/bin/zsh-patina" ]]; then
		eval "$($HOMEBREW_PREFIX/opt/zsh-patina/bin/zsh-patina activate)"
	fi
elif [[ -f ~/.cargo/bin/zsh-patina ]]; then
	eval "$(~/.cargo/bin/zsh-patina activate)"
fi
