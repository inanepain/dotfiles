##################################################
## zsh: config
##################################################
source "${0:A:h}/include/inc.plugins.detect.zsh"
addToPathAndClean $HOME/.config/composer/vendor/bin "before"


if hasSoftware "port"; then
	if zstyle -t ':inane:function:software:plugin' 'success'; then
		msg "Found Plugin Software: ${Green}port"
	fi
    plugins+=($plugins macports)
elif zstyle -t ':inane:function:software:plugin' 'error'; then
		msg "Missing Software: ${Red}port"
fi

plugins+=($plugins autoupdate forgit zsh-interactive-cd zsh-navigation-tools zsh-autosuggestions)
