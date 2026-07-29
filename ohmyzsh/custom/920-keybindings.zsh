#########################################
#		 INANE PLUGIN: 003: Key bindings
# version: 2                  2021 Nov 14
#############################-###########

## GENERAL
##########################################################
# (e)xit
bindkey -s '^[e' 'exit^M'

# (o)oh-my-zsh (r)eload
# bindkey -s '^[o^[r' 'omz reload^M'

# (i)nane (r)eload
bindkey -s '^[i^[r' 'inane-x reload^M'

## UPDATE: alt-i + alt+u
##########################################################

# alt-i + alt+u + alt+b: batch-upgrade
# (i)nane (u)pdate (b)atch
# bindkey -s '^[i^[u^[b' 'batch-upgrade^M'

# alt-i + alt+u + alt+s: smart-update
# (i)nane (U)pdate (S)mart
# bindkey -s '^[i^[u^[s' 'smart-update.sh^M'

# (i)nane (u)pdate (t)opgrade
# bindkey -s '^[i^[u^[t' 'topgrade^M'

## BREW: alt-i + alt+b
##########################################################

# (i)nane + (b)rew + (d)etails: package info
bindkey -s '^[i^[b^[d' 'brew info `pbpaste`^M'

# (i)nane + (b)rew + (s)earch: package search
bindkey -s '^[i^[b^[s' 'brew search `pbpaste`^M'

# (i)nane + (b)rew + (i)nstall: package install
bindkey -s '^[i^[b^[i' 'brew install `pbpaste`^M'

# (i)nane + (b)rew + (r)efresh (update): brew update
bindkey -s '^[i^[b^[r' 'brew update^M'

# (i)nane + (b)rew + (u)pgrade: brew upgrade
bindkey -s '^[i^[b^[u' 'brew upgrade^M'

## DIRENV: alt-i + alt+d
##########################################################

# (d)ir(e)nv (a)llow directory
bindkey -s '^[d^[e^[a' 'direnv allow^M'

if [[ -f ~/bin/action-picker.zsh ]]; then
	# (s)cript (a)ction (p)icker
	bindkey -s '^[s^[a^[p' 'action-picker.zsh^M'
fi
