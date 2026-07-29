#########################################
#		     oh-my-zsh - custom: 061: cmd
# version: 2                  2026 Jul 29
#############################-###########

## command
# intelli-shell
#####################################################################
if [ -z "$INTELLIJ_ENVIRONMENT_READER" ]; then
	# eval "$(clippy completion zsh)"
	# PROG=tea _CLI_ZSH_AUTOCOMPLETE_HACK=1 source "/Users/philip/Library/Application Support/tea/autocomplete.zsh"
	export GEMINI_API_KEY="AIzaSyBfcbh4CWayxDJD4WCAzi3DUtJnkAyhe-g"

	if which intelli-shell >/dev/null; then
		eval "$(intelli-shell init zsh)"
	fi
fi
