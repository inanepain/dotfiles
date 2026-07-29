##################################################
## zsh: config
##################################################
# export STARSHIP_CONFIG=~/.config/starship/default.toml
export STARSHIP_CONFIG=~/.config/starship/develop.toml
# export STARSHIP_CONFIG=~/.config/starship/playground.toml

plugins+=($plugins autoupdate brew composer copybuffer dash direnv extract eza forgit iterm2 jj macos mosh rsync starship thefuck tldr tt zsh-autosuggestions zsh-interactive-cd zsh-navigation-tools)
