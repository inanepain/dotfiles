#!/usr/bin/env zsh

hide_file_extension_recursive() {
  emulate -L zsh

  if (( $# == 0 )); then
    print -u2 "Usage: hide_file_extension_recursive <file-or-directory> [...]"
    return 2
  fi

  if (( ! $+commands[SetFile] )); then
    print -u2 "SetFile is required; install Xcode Command Line Tools with: xcode-select --install"
    return 127
  fi

  local input path file rc=0

  for input in "$@"; do
    path=${input:A}

    if [[ -f $path ]]; then
      /usr/bin/setfile -a E "$path" || rc=1

    elif [[ -d $path ]]; then
      while IFS= read -r -d '' file; do
        /usr/bin/setfile -a E "$file" || rc=1
      done < <(/usr/bin/find "$path" -type f -print0)

    else
      print -u2 "Not a file or directory: $input"
      rc=1
    fi
  done

  return $rc
}

hide_file_extension_recursive "$@"