# Detect plugins for OMZ

addPlugin "brew"
addPlugin "composer"
addPlugin "direnv"
addPlugin "tldr"
addPlugin "eza"
addPlugin "jj"
addPlugin "npm"

if [[ ! $TERMINAL_EMULATOR = "JetBrains-JediTerm" ]]; then
    addPlugin "starship"
fi


