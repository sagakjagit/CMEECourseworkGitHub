#!/bin/bash
# Author: Saga Kjallgren slk26@ic.ac.uk
# Script: csvtospace.sh
# Desc: substitute the commas in the files with spaces
#       saves the output into a .txt file
# Arguments: 1-> comma delimited file
# Date: Oct 2026

if [[ $# -ne 1 ]]; then
    printf 'Usage: %s <comma-delimited-file>\n' "$0" >&2
    exit 1
fi

if [[ ! -f "$1" ]]; then
    printf 'Error not a file: %s\n' "$1" >&2
    exit 2
fi

if [[ ! -r "$1" ]]; then
    printf 'Error cannot read file: %s\n' "$1" >&2
    exit 3
fi

if ! mkdir -p results; then
    printf 'Error: could not create results directory.\n' >&2
    exit 4
fi

output_file="results/$(basename "$1").txt"

echo "Creating a space delimited version of $1 ..."

if cat "$1" | tr "," " " > "$output_file"; then
    echo "Done!"

else
    printf 'Error: csv to space conversion failed.\n' >&2
    rm -f "$output_file"
    exit 5
fi

exit 0