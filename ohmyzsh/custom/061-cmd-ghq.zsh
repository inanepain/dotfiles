#########################################
#        oh-my-zsh - custom: 005: aliases
# version: 1                  2025 Aug 08
#############################-###########

## command
# ghq
#####################################################################
if hasSoftware "ghq"; then
    # list ghq repositories and cd to selected one
	function ghq-cd() {
		local repo=$(ghq list | fzf)
		[ -n "$repo" ] && cd "$(ghq root)/$repo"
	}

    # update ghq repositories    
    function ghq-pull() {
        for r in $(ghq list); do ghq get --shallow -u $r; done
    }
fi
