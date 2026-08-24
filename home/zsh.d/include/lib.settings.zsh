#########################################
#		    zsh.d - include: settings
# version: 1                  2026 Aug 25
#############################-###########
typeset -A settings_defaults=(
    [key1]="val1"
    [key2]="val2"
)

# typeset -A settings=("${(@kv)settings_defaults}")
typeset -A settings=()

# typeset settings_file="$XDG_CONFIG_HOME/zsh.d/settings.json"
typeset settings_file="settings.json"


# ---------------------------------------------------------------------------
# Read settings
# ---------------------------------------------------------------------------
settings::read() {
    local key value

    [[ -f "$settings_file" ]] || return 0
    command jq -e 'type == "object"' "$settings_file" &>/dev/null || return 1

    while IFS= read -r key; do
        # Only load known settings
        (( ${+settings_defaults[$key]} )) || continue

        value="$(command jq -r --arg key "$key" '.[$key]' "$settings_file")"

        settings[$key]="$value"
    done < <(command jq -r 'keys[]' "$settings_file")
}

# ---------------------------------------------------------------------------
# Write settings
# ---------------------------------------------------------------------------
settings::write() {
    local key
    local directory="${settings_file:h}"
    local tmp="${settings_file}.tmp.$$"
    local -a args

    # Create the settings directory if required
    if [[ ! -d "$directory" ]]; then
        mkdir -p "$directory" || return 1
    fi

    for key in "${(@k)settings}"; do
        args+=( --arg "$key" "${settings[$key]}" )
    done

    if ! command jq -n "${args[@]}" '$ARGS.named' >| "$tmp"; then
        rm -f "$tmp"
        return 1
    fi

    mv -f "$tmp" "$settings_file"
}

# ---------------------------------------------------------------------------
# Get setting
# ---------------------------------------------------------------------------
settings::get() {
    local key="$1"
    local default="${2:-}"

    if (( ${+settings[$key]} )); then
        print -r -- "${settings[$key]}"
    else
        print -r -- "$default"
    fi
}

# ---------------------------------------------------------------------------
# Set setting
# ---------------------------------------------------------------------------
settings::set() {
    local key="$1"
    local value="$2"

    # Don't allow unknown settings
    (( ${+settings_defaults[$key]} )) || return 1

    settings[$key]="$value"
}

# ---------------------------------------------------------------------------
# Check setting
# ---------------------------------------------------------------------------
settings::has() {
    local key="$1"

    (( ${+settings[$key]} ))
}

# ---------------------------------------------------------------------------
# Reset setting
# ---------------------------------------------------------------------------
settings::reset() {
    local key="$1"

    (( ${+settings_defaults[$key]} )) || return 1

    settings[$key]="${settings_defaults[$key]}"
}

# ---------------------------------------------------------------------------
# Reset all settings
# ---------------------------------------------------------------------------
settings::reset::all() {
    settings=("${(@kv)settings_defaults}")
}

# ---------------------------------------------------------------------------
# Initialise
# ---------------------------------------------------------------------------
settings::init() {
	settings::reset::all
    settings::read
}
