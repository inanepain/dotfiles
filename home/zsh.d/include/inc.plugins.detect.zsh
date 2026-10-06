# Detect plugins for OMZ

addPlugin "brew"
addPlugin "composer"
addPlugin "copybuffer" "-"
addPlugin "cp" "rsync"
addPlugin "direnv"
addPlugin "eza"
addPlugin "gh"
addPlugin "httpie"
addPlugin "jj"
addPlugin "macports" "port"
addPlugin "magic-enter" "-"
addPlugin "npm"
addPlugin "tldr"
addPlugin "tt" "-"

if [[ $INANE_TERM_PROGRAM = "iTerm.app" ]]; then
	addPlugin "iterm2" "-"
fi

if [[ ! $TERMINAL_EMULATOR = "JetBrains-JediTerm" ]]; then
    addPlugin "starship"
fi
