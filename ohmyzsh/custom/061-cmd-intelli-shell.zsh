#########################################
#		     oh-my-zsh - custom: 061: cmd
# version: 2                  2026 Jul 29
#############################-###########

## command
# intelli-shell
#####################################################################
# SKIP IF: PHPStorm
if [ -z "$INTELLIJ_ENVIRONMENT_READER" ]; then
    export GEMINI_API_KEY="AIzaSyBfcbh4CWayxDJD4WCAzi3DUtJnkAyhe-g"
    export INTELLI_HOME="$HOME/.local/share/intelli-shell"

    add_to_path "$INTELLI_HOME/bin"

    if hasSoftware "intelli-shell"; then
        export INTELLI_SEARCH_HOTKEY='^@'
        export INTELLI_VARIABLE_HOTKEY='^l'
        export INTELLI_BOOKMARK_HOTKEY='^b'
        export INTELLI_FIX_HOTKEY='^x'
        export INTELLI_SKIP_ESC_BIND=0
        alias is="intelli-shell"
		eval "$(intelli-shell init zsh)"
	fi
    
    
fi
