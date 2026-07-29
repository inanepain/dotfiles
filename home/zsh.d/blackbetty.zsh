##################################################
## zsh: config
##################################################
# export STARSHIP_CONFIG=~/.config/starship/develop.toml

plugins+=($plugins autoupdate brew composer copybuffer dash direnv extract eza forgit iterm2 jj macos mosh rsync thefuck tldr tt zsh-autosuggestions zsh-interactive-cd zsh-navigation-tools)

if [[ ! $TERMINAL_EMULATOR = "JetBrains-JediTerm" ]]; then
	plugins+=($plugins starship)
fi
