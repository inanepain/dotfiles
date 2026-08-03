##############################################
#### direnv: logging & messaging
####                               2026 Aug 03
##################################-###########

#### MSG & COLOUR
##############################################
## NO COLOUR
NC='\033[0m'              # Text Reset

## Regular Colors (0)
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# message with colour support
function msg {
    echo -e "${@}${NC}"
}

#### DEPRECATED MESSAGING
##############################################
function dmsg() {
    ${ENV_DIR_QUIET-false} || echo "$@"
    # if [[ ! ${ENV_DIR_QUIET-false} == true ]]; then
    # 	echo "$@"
    # fi
}

function delog() {
    ${ENV_DIR_DEBUG-false} && dmsg "$@"
    # if [[ ${ENV_DIR_DEBUG-false} == true ]]; then
    # 	dmsg "$@"
    # fi
}

function header() {
    delog "		*** $@ ***"
}

function log_debug() {
    delog "DEBUG: $@"
}
