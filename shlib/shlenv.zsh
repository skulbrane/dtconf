#!/usr/bin/env zsh

DT_OS_TYPE="$(uname -o)" # OS Type as reported by `uname -o`

function inc() {
    "$1"="$(expr "$1" + 1)"
    echo "$1"
}

function ostype() {
    echo $(uname -o)
}

function is_linux() {
    [ "$DT_OS_TYPE" = "$(ostype)" ] && echo 0
}

