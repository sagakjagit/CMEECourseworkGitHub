#!/bin/bash
# Author: Saga Kjallgren slk26@ic.ac.uk
# Script: tabtocsv.sh
# Desc: substitute the tabs in the files with commas
#       saves the output into a .csv file
# Arguments: 1-> tab delimited file
# Date: Oct 2026

if [[ $# -ne 1 ]]; then
    printf 'Usage: %s <tab-delimited-file>\n' "$0" >&2
    exit 2
fi

echo "Creating a comma delimited version of $1 ..."

cat "$1" | tr "\t" "," > "$1.csv"

echo "Done!"

exit 