#!/usr/bin/env bash

if [[ $# -eq 0 ]]; then
    echo "Usage: $0 FILE"
    exit 1
fi

file="$1"

if [[ ! -f "$file" ]]; then
    echo "Error: file not found: $file"
    exit 1
fi

error_count=$(grep -c "ERROR" "$file")

top_code=$(
    grep "ERROR" "$file" \
    | grep -o 'code=[0-9]*' \
    | cut -d'=' -f2 \
    | sort \
    | uniq -c \
    | sort -nr \
    | head -n 1 \
    | awk '{print $2}'
)

echo "Total ERROR: $error_count"
echo "Top Code: $top_code"

exit 0