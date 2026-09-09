#!/usr/bin/env just --justfile

##################################################
##################################################
########## JUST HELPER: Handle OMZ plugins
##################################################
##################################################

# dotfiles
# version: $Id$
# date: $Date$

set shell := ["zsh", "-cu"]
set positional-arguments
set dotenv-load

# list recipes
_default:
    @echo "$PROJECT:"
    @just --list --list-heading ''

#region UTILITIES
# start
_start task='':
    @echo "{{YELLOW}}start{{NORMAL}}: {{task}}"

# done
_done task='':
    @echo "{{RED}}done{{NORMAL}} {{task}}"

# notice
[arg('target', pattern='[a-zA-Z]+[a-zA-Z0-9-_]+', help="Package or recourse being acted upon.")]
[arg('suffix', pattern='[a-zA-Z]+', help="Action state modifier.")]
[arg('action', pattern='[a-zA-Z]+', help="Base action work.")]
_notice target suffix='ing' action='Install':
    @echo "\t{{CYAN}}{{action}}{{suffix}}: {{BLUE}}{{target}}{{NORMAL}}"

#endregion UTILITIES

#region OH MY ZSH PLUGINS
# plugin clone: default plugins: autoupdate, forgit, autosuggestions
[group: 'oh-my-zsh plugins']
omz-clone-default: (_start "OMZ: plugin: default") omz-clone-autoupdate omz-clone-forgit omz-clone-autosuggestions && (_done "OMZ: plugin: default")

####################################################################################################

# plugin clone: autoupdate
[group: 'oh-my-zsh plugins']
omz-clone-autoupdate: (_start "OMZ: plugin: autoupdate") && (_done "OMZ: plugin: autoupdate")
    #!/usr/bin/env zsh
    if [[ ! -d ~/.oh-my-zsh/custom/plugins/autoupdate ]]; then
        just _notice autoupdate
        git clone https://github.com/tamcore/autoupdate-oh-my-zsh-plugins ~/.oh-my-zsh/custom/plugins/autoupdate
    else
        just _notice autoupdate ed
    fi

# plugin clone: forgit
[group: 'oh-my-zsh plugins']
omz-clone-forgit: (_start "OMZ: plugin: forgit") && (_done "OMZ: plugin: forgit")
    #!/usr/bin/env zsh
    if [[ ! -d ~/.oh-my-zsh/custom/plugins/forgit ]]; then
        just _notice forgit
        git clone https://github.com/wfxr/forgit ~/.oh-my-zsh/custom/plugins/forgit
    else
        just _notice forgit ed
    fi

# plugin clone: autosuggestions
[group: 'oh-my-zsh plugins']
omz-clone-autosuggestions: (_start "OMZ: plugin: autosuggestions") && (_done "OMZ: plugin: autosuggestions")
    #!/usr/bin/env zsh
    if [[ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]]; then
        just _notice autosuggestions
        git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    else
        just _notice autosuggestions ed
    fi

# plugin clone: syntax-highlighting
[group: 'oh-my-zsh plugins']
omz-clone-syntax-highlighting: (_start "OMZ: plugin: syntax-highlighting") && (_done "OMZ: plugin: syntax-highlighting")
    #!/usr/bin/env zsh
    if [[ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]]; then
        just _notice syntax-highlighting
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    else
        just _notice syntax-highlighting ed
    fi

####################################################################################################

# plugin update
[group: 'oh-my-zsh plugins']
omz-update-plugins: (_start "OMZ: plugins: updating...") && (_done "OMZ: plugins: updated")
    #!/usr/bin/env zsh
    cd ~/.oh-my-zsh/custom/plugins
    for f in */.git/config; do echo "\t$(dirname $(dirname $f))"; cd $(dirname $f); cd ..; git pull; cd ..; done

#endregion OH MY ZSH PLUGINS

#region INSTALL SOFTWARE
# Install common software with brew
[group: 'brew']
brew-install bundle="all": (_start "brew: install: {{bundle}}") && (_done "brew: install: {{bundle}}")
    #!/usr/bin/env zsh
    brew-

#endregion INSTALL SOFTWARE
