#!/usr/bin/env bash

if [[ $# -lt 2 ]]; then
    echo "Usage: $0 DEST FILE..." >&2
    exit 1
fi

dest="$1"
shift

mkdir -p "$dest"

for file in "$@"; do
    if [[ ! -f "$file" ]]; then
        echo "Error: file not found: $file" >&2
        exit 1
    fi

    cp -- "$file" "$dest/"
done

exit 0