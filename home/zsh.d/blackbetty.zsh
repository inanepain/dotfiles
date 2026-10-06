##################################################
## zsh: zsh: included after functions loaded.
# cp ~/.dotfiles/home/zsh.d/template.zsh.dist ~/.zsh.d/$OPT_SOURCE.zsh
##################################################
source "${0:A:h}/include/inc.plugins.detect.zsh"
addToPathAndClean ~/bin/short-term
plugins+=(autoupdate dash extract forgit macos mosh rsync zsh-autosuggestions zsh-interactive-cd zsh-navigation-tools)
