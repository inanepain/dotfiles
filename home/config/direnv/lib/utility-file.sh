##############################################
#### direnv: utilities for files
####                               2026 Aug 03
##################################-###########

#### .DS_Store Deprecated
##############################################
# count DS_Store files
function clean-files-count() {
    fd --hidden --no-ignore ".DS_Store" | wc -l | awk '{print $1}'
}

# Ask/Auto clean found DS_Store files
function clean-files-osx() {
    if [[ ! $(clean-files-count) == "0" ]]; then
		local dirtyFiles;
		dirtyFiles="$(clean-files-count)"
        if [[ ${ENV_DIR_AUTO_CLEAN:-false} == true ]]; then
            delog "Found $dirtyFiles DS_Store files: AUTO CLEANING"
            find "${@:-.}" -type f -name .DS_Store -delete
        else
            if fask "Found $dirtyFiles DS_Store files. Remove?" Y; then
                delog "removing: .DS_Store"
                find "${@:-.}" -type f -name .DS_Store -delete
            fi
        fi
    fi
}

#### .DS_Store File Clean up
##############################################
# the count of .DS_Store files
function files-ds-store-count() {
	fd -IH --glob ".DS_Store" | wc -l | awk '{print $1}'
}

# echo .DS_Store count with optional count override (and message)
function files-ds-store-echo() {
	local dsFiles;
	dsFiles="${*:-$(files-ds-store-count)}"
	msg ".DS_Store Files: $Red$dsFiles"
}

# clean .DS_Store files with message
function files-ds-store-clean() {
	local dsFiles;
	dsFiles="$(files-ds-store-count)"
	if [[ ! $dsFiles == "0" ]]; then
		fd -IH --glob ".DS_Store" "${@:-.}" -x trash
		files-ds-store-echo "$dsFiles (CLEANED)"
	fi
}

#### Code Runner Temp File Clean up
##############################################
# the count of code runner temp files
function files-code-runner-count() {
	fd -I --glob "tempCodeRunner*.*" | wc -l | awk '{print $1}'
}

# echo code runner count with optional count override (and message)
function files-code-runner-echo() {
	local crTempFiles;
	crTempFiles="${*:-$(files-code-runner-count)}"
	msg "Code Runner Temp Files: $Red$crTempFiles"
}

# clean code runner temp files with message
function files-code-runner-clean() {
	local crTempFiles;
	crTempFiles="$(files-code-runner-count)"
	if [[ ! $crTempFiles == "0" ]]; then
		fd -I --glob "tempCodeRunner*.*" "${@:-.}" -x trash
		files-code-runner-echo "$crTempFiles (CLEANED)"
	fi
}
