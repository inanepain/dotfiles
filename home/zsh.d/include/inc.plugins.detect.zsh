# Detect plugins for OMZ

addPlugin "brew"
addPlugin "composer"
addPlugin "direnv"
addPlugin "tldr"
addPlugin "eza"
addPlugin "jj"
addPlugin "npm"
addPlugin "cp" "rsync"
addPlugin "copybuffer" "-"
addPlugin "gh"
addPlugin "httpie"
addPlugin "magic-enter" "-"
addPlugin "tt" "-"

if [[ ! $TERMINAL_EMULATOR = "JetBrains-JediTerm" ]]; then
    addPlugin "starship"
fi


