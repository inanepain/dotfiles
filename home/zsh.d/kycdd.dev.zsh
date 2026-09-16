##################################################
## zsh: config
##################################################
source "${0:A:h}/include/inc.plugins.detect.zsh"
# export STARSHIP_CONFIG=~/.config/starship/develop.toml

plugins+=($plugins autoupdate copybuffer forgit zsh-autosuggestions zsh-interactive-cd zsh-navigation-tools zsh-you-should-use)
