#########################################
#		oh-my-zsh - custom: 005: aliases
# version: 1                 2025 Aug 08
#############################-###########

## aliases
# standard: changing directory
#####################################################################
alias d='dirs -v | head -10'
# alias 1='cd -'
# alias 2='cd -2'
# alias 3='cd -3'
# alias 4='cd -4'
# alias 5='cd -5'
# alias 6='cd -6'
# alias 7='cd -7'
# alias 8='cd -8'
# alias 9='cd -9'

# standard: tweak existing commands
#####################################################################
alias mkdir='mkdir -p'

## aliases
# global:
#####################################################################
# Mark Text
if [[ -f /Applications/MarkText.app/Contents/MacOS/MarkText ]]; then
    alias marktext=/Applications/MarkText.app/Contents/MacOS/MarkText
elif [[ -f ~/Applications/MarkText.app/Contents/MacOS/MarkText ]]; then
    alias marktext=~/Applications/MarkText.app/Contents/MacOS/MarkText
fi
#####################################################################
