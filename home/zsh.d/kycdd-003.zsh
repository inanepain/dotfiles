##################################################
## zsh: config
##################################################
source include/inc.plugins.detect.zsh

addToPathAndClean $HOME/.config/composer/vendor/bin "before"

plugins+=($plugins autoupdate brew composer direnv forgit starship zsh-interactive-cd zsh-navigation-tools zsh-autosuggestions)

