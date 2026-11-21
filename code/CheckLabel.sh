#!/bin/bash
#!/bin/bash
# Author: Saga Kjällgren
# Script: CheckLabel.sh
# Desc: Demonstrates conditional statements and command-line argument validation.
# Arguments: One species label (oak or pine).
# Date: November 2026

if [[ $# -ne 1 ]]; then
    printf 'Usage: %s oak|pine\n' "$0" >&2
    exit 2
fi

if [[ "$1" != "oak" && "$1" != "pine" ]]; then
    printf 'Unknown label: %s\n' "$1" >&2
    exit 1
fi

printf 'Selected species: %s\n' "$1"