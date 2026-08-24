#########################################
#		oh-my-zsh: command
# version: 1                 2025 Aug 08
#############################-###########

## command
# pet
#####################################################################
if hasSoftware "pet"; then
	# export FZF_CTRL_R_OPTS="
	# 	--reverse
	# 	--cycle
	# 	--info=right
	# 	--color header:italic
	# 	--header 'alt+s (pet new)'
	# 	--preview 'echo {}' --preview-window down:3:hidden:wrap 
	# 	--bind '?:toggle-preview'
	# 	--bind 'alt-s:execute(pet new --tag {2..})+abort'"

	function pet-select() {
		BUFFER=$(pet search --query "$LBUFFER")
		CURSOR=$#BUFFER
		zle redisplay
	}
	zle -N pet-select
	stty -ixon
	bindkey '^s' pet-select

	function _pet_move_cursor_to_next_parameter() {
		match="$(echo "$BUFFER" | perl -nle 'print $& if /<.*?>/')"
		if [ -n "$match" ]; then
		default="$(echo "$match" | perl -nle 'print $& if /(?<==).*(?=>)/')"
		match_len=${#match}
		default_len=${#default}
		parameter_offset=${#BUFFER%%$match*}

		CURSOR="$((${parameter_offset} + ${default_len}))"
		BUFFER="${BUFFER[1,$parameter_offset]}${default}${BUFFER[$parameter_offset+$match_len+1,-1]}"
		fi        
	}
	zle -N _pet_move_cursor_to_next_parameter
	bindkey '^n' _pet_move_cursor_to_next_parameter 
fi
