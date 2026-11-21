#!/bin/bash
# Author: Saga Kjällgren
# Script: tiff2_png.sh
# Desc: Converts TIFF images to PNG format in the current directory.
# Arguments: None.
# Date: November 2026

for filename in *.tif
do
    echo "Converting $filename"
    magick "$filename" "$(basename "$filename" .tif).png"
done