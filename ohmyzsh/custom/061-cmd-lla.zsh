#########################################
#		oh-my-zsh - custom: 005: aliases
# version: 1                 2025 Aug 08
#############################-###########

## command
# lla
#####################################################################
if which lla >/dev/null; then
  # alias ls='\lla'
  # alias l='ls -l'
  # alias lS='ls -S'
  # alias ll='ls -l'
  # alias la='ls -a'
  # alias lA='ls -A'
  # alias lla='ls -la'

  # alias lt='ls --tree'
  # alias lg='ls -G'
  # alias lT='ls -T'

  # alias lk='ll -Sr'
  # alias lm='ll -sdate'

  # alias ltl='ls --timeline'
  
  function j() {
    local dir=$(lla jump)
    if [ -n "$dir" ] && [ -d "$dir" ]; then
      cd "$dir"
    fi
  }
fi
