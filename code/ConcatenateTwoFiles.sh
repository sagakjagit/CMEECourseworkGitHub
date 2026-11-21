#!/bin/bash
# Author: Saga Kjällgren
# Script: ConcatenateTwoFiles.sh
# Desc: Combines the contents of two input files into a third output file.
# Arguments: Two input file paths and one output file path.
# Date: November 2026

cat "$1" > "$3"
cat "$2" >> "$3"
echo "Merged File is"
cat "$3"