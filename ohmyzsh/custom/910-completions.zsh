#########################################
#		INANE PLUGIN: 002: Completion
# version: 1                 2022 Mar 15
#############################-###########

compctl -/g 'queues/*.txt' gallery-tool.sh
test -e "$HOME/.shellfishrc" && source "$HOME/.shellfishrc"

if which brew >/dev/null; then
    if [[ -f "$(brew --prefix)/opt/fzf-tab/share/fzf-tab/fzf-tab.zsh" ]]; then
		source "$(brew --prefix)/opt/fzf-tab/share/fzf-tab/fzf-tab.zsh"
	fi
fi
