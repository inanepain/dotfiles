##################################################
## zsh: config
##################################################

addToPathAndClean $HOME/.config/composer/vendor/bin "before"

plugins+=($plugins autoupdate composer direnv forgit starship zsh-interactive-cd zsh-navigation-tools zsh-autosuggestions)

