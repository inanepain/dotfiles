##################################################
## zsh: zshrc: included right at the end of zshrc.
# cp ~/.dotfiles/home/zsh.d/template.zshrc.dist ~/.zsh.d/$OPT_SOURCE.zshrc
##################################################
alias zrzu="zref && zup -y"
alias znr="sudo needs-restarting"

# shortcuts develop
#========================================================
develop=/mnt/c/Users/PhilipRaab/opt/develop
inane=/mnt/c/Users/PhilipRaab/opt/inane-fw
kycdd=/mnt/c/Users/PhilipRaab/Repositories/kycdd
: ~develop ~inane ~kycdd

if [[ ! -f ~/etc/atuin.sync || $(fileage -h ~/etc/atuin.sync) -gt 24 ]]; then
	touch ~/etc/atuin.sync
	atuin sync
fi
