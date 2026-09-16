# Detect plugins for OMZ

if hasSoftware "brew"; then
    plugins+=($plugins brew)
fi

if hasSoftware "composer"; then
    plugins+=($plugins composer)
fi

if hasSoftware "direnv"; then
    plugins+=($plugins direnv)
fi

if hasSoftware "tldr"; then
    plugins+=($plugins tldr)
fi

if hasSoftware "eza"; then
    plugins+=($plugins eza)
fi

if [[ ! $TERMINAL_EMULATOR = "JetBrains-JediTerm" ]]; then
    if hasSoftware "starship"; then
	    plugins+=($plugins starship)
    fi
fi


