# Detect plugins for OMZ

if hasSoftware "brew"; then
	if zstyle -t ':inane:function:software:plugin' 'success'; then
		msg "Found Plugin Software: ${Green}brew"
	fi
    plugins+=($plugins brew)
elif zstyle -t ':inane:function:software:plugin' 'error'; then
		msg "Missing Software: ${Red}brew"
fi

if hasSoftware "composer"; then
	if zstyle -t ':inane:function:software:plugin' 'success'; then
		msg "Found Plugin Software: ${Green}composer"
	fi
    plugins+=($plugins composer)
elif zstyle -t ':inane:function:software:plugin' 'error'; then
		msg "Missing Plugin Software: ${Red}composer"
fi

if hasSoftware "direnv"; then
	if zstyle -t ':inane:function:software:plugin' 'success'; then
		msg "Found Plugin Software: ${Green}direnv"
	fi
    plugins+=($plugins direnv)
elif zstyle -t ':inane:function:software:plugin' 'error'; then
		msg "Missing Plugin Software: ${Red}direnv"
fi

if hasSoftware "tldr"; then
	if zstyle -t ':inane:function:software:plugin' 'success'; then
		msg "Found Plugin Software: ${Green}tldr"
	fi
    plugins+=($plugins tldr)
elif zstyle -t ':inane:function:software:plugin' 'error'; then
		msg "Missing Plugin Software: ${Red}tldr"
fi

if hasSoftware "eza"; then
	if zstyle -t ':inane:function:software:plugin' 'success'; then
		msg "Found Plugin Software: ${Green}eza"
	fi
    plugins+=($plugins eza)
elif zstyle -t ':inane:function:software:plugin' 'error'; then
		msg "Missing Plugin Software: ${Red}eza"
fi

if hasSoftware "jj"; then
	if zstyle -t ':inane:function:software:plugin' 'success'; then
		msg "Found Plugin Software: ${Green}jj"
	fi
    plugins+=($plugins jj)
elif zstyle -t ':inane:function:software:plugin' 'error'; then
		msg "Missing Plugin Software: ${Red}jj"
fi

if [[ ! $TERMINAL_EMULATOR = "JetBrains-JediTerm" ]]; then
	if hasSoftware "starship"; then
		if zstyle -t ':inane:function:software:plugin' 'success'; then
			msg "Found Plugin Software: ${Green}starship"
		fi
		plugins+=($plugins starship)
	elif zstyle -t ':inane:function:software:plugin' 'error'; then
			msg "Missing Plugin Software: ${Red}starship"
	fi
fi


