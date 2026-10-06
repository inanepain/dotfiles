##################################################
## zsh: zsh: included after functions loaded.
# cp ~/.dotfiles/home/zsh.d/template.zsh.dist ~/.zsh.d/$OPT_SOURCE.zsh
##################################################
source "${0:A:h}/include/inc.plugins.detect.zsh"
plugins+=(zsh-interactive-cd zsh-navigation-tools zsh-autosuggestions zsh-syntax-highlighting)
