##################################################
## zsh: config
##################################################
source "${0:A:h}/include/inc.plugins.detect.zsh"
addToPathAndClean $HOME/.config/composer/vendor/bin "before"

addPlugin "macports" "port"

plugins+=(autoupdate forgit zsh-interactive-cd zsh-navigation-tools zsh-autosuggestions)
