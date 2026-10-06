##################################################
## zsh: config
##################################################
source "${0:A:h}/include/inc.plugins.detect.zsh"

# export STARSHIP_CONFIG=~/.config/starship/develop.toml

plugins+=(autoupdate dash extract forgit iterm2 macos mosh rsync zsh-autosuggestions zsh-interactive-cd zsh-navigation-tools)
# thefuck

# if [[ ! $TERMINAL_EMULATOR = "JetBrains-JediTerm" ]]; then
# 	plugins+=(starship)
# fi

addToPathAndClean ~/bin/short-term
