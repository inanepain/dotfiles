# Detect plugins for OMZ

if hasSoftware "brew"; then
    plugins+=($plugins brew)
fi

if [[ ! $TERMINAL_EMULATOR = "JetBrains-JediTerm" ]]; then
    if hasSoftware "starship"; then
	    plugins+=($plugins starship)
    fi
fi


