#!/usr/bin/env zsh

local VERSION=1
local DEVELOPER="Philip Michael Raab <peep@inane.co.za>"
local SHARED_GLOBAL_TAGS="zsh script"
local thisScript=$(basename $0)

autoload ask colours
colours

local this=$Purple$thisScript$NC
local ver=$Blue$VERSION$NC

## show version
# shows script name and version
# usage: showVersion
function showVersion() {
    msg "$this (v$ver)"
}

## show help
# shows the scripts help
# usage: showHelp [error]
function showHelp() {
    showVersion
    msg "${White}usage$NC: $this <file>"

    [[ ! $1 == "" ]] && echo "\tError: $1\n"

    # echo "COMMANDS"
    # echo "\tkill\tDoes nothing"

    echo "OPTIONS"
    echo "\t-h\tShow this help"
    echo "\tfile\tFile to be checked for hashes"

    [[ ! $1 == "" ]] && exit 1
}

## has
# tests if a command is in the path
# usage: has <command>
function has() {
    [[ -f $(which $1) ]] && return 0 || return 1
}

## verify file
# Searches for files possibly containing hashes to verify against file
# usage verifyFile <file>
function verifyFile() {
    local in_file=$1
    local passed=false
    local test_count=0
    local hash_type

    # loop over possible files containing hash values
    for f in "${in_file}."*; do
        if [[ $passed = false ]]; then
            hash_type=${f/$in_file./}

            if has "${hash_type}sum"; then
                msgf "\tchecking: ${BCyan}$f$NC\t=> "
                ((test_count++))
                if [[ $(cat $f) = $("${hash_type}sum" $in_file) ]]; then
                    passed=true
                    msg "${Green}OK"
                    break
                else
                    msg "${Red}Fail"
                fi
            elif has "${hash_type}"; then
                msgf "\tchecking: ${BCyan}$f$NC\t=> "
                ((test_count++))
                if [[ $(cat $f) = $("${hash_type}" $in_file) ]]; then
                    passed=true
                    msg "${Green}OK"
                    break
                else
                    msg "${Red}Fail"
                fi
            fi
        fi
    done

    msgf "File hash verification: "

    if [[ $passed = false ]]; then
        if [[ $test_count = 0 ]]; then
            msg "${BYellow}UNKNOWN$NC => no hash verification files found!"
            test_count=1
        else
            msg "${Red}FAILED$NC => $test_count"
        fi
        exit $test_count
    fi

    msg "$Blue$hash_type$NC => ${Green}VALID"
}

if [[ $1 == "-h" ]]; then
    showHelp
elif [[ $# -eq 0 || $# -gt 1 ]]; then
    showHelp "Invalid arguments"
elif [[ ! -f $1 ]]; then
    showHelp "Invalid file: $1"
else
    verifyFile $1
fi
