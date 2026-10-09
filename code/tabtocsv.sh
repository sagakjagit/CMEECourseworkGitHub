#!/bin/bash
# Author: Saga Kjallgren slk26@ic.ac.uk
# Script: tabtocsv.sh
# Desc: substitute the tabs in the files with commas
#       saves the output into a .csv file
# Arguments: 1-> tab delimited file
# Date: Oct 2026

if [[ $# -ne 1 ]]; then
    printf 'Usage: %s <tab-delimited-file>\n' "$0" >&2
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

output_file="../results/$(basename "$1").csv"
mkdir -p ../results

echo "Creating a comma delimited version of $1 ..."

cat "$1" | tr "\t" "," > "$output_file"

echo "Done!"

exit 0 