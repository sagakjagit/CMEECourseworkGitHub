#!/bin/bash
# Author: Saga Kjällgren
# Script: CountLines.sh
# Desc: Counts the number of lines in a specified file.
# Arguments: Input filename.
# Date: November 2026

NumLines=`wc -l < "$1"`
echo "The file $1 has $NumLines lines"
echo

