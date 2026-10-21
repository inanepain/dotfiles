##################################################
## zsh: zshrc: included right at the end of zshrc.
##################################################
# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"
source /Users/philip/.config/op/plugins.sh

if [[ ! -f ~/etc/atuin.sync || $(fileage -h ~/etc/atuin.sync) -gt 24 ]]; then
	touch ~/etc/atuin.sync
	atuin sync
fi

if [[ $INANE_SHELL_TYPE -gt 0 ]]; then
	~/Sites/blackbetty/bin/fortune
fi
