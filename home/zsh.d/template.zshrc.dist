##################################################
## zsh: zshrc: included right at the end of zshrc.
# cp ~/.dotfiles/home/zsh.d/template.zshrc.dist ~/.zsh.d/$OPT_SOURCE.zshrc
##################################################

if [[ ! -f ~/etc/atuin.sync || $(fileage -h ~/etc/atuin.sync) -gt 24 ]]; then
	touch ~/etc/atuin.sync
	atuin sync
fi
