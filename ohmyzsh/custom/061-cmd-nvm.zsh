#########################################
#		oh-my-zsh - custom: 005: aliases
# version: 1                 2025 Aug 08
#############################-###########

## command
# nvm
#####################################################################
# zstyle ':inane:function:software' 'error' yes
# zstyle ':inane:function:software' 'success' yes
if [[ -f "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ]]; then
	export NVM_DIR="$HOME/.nvm"
	[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"                                       # This loads nvm
	[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
fi
# zstyle ':inane:function:software' 'error' no
# zstyle ':inane:function:software' 'success' no