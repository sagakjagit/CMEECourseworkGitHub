#!/usr/bin/env Rscript
# Author: Saga Kjällgren
# Script: basic_io.R
# Desc: A simple R script illustrating file input and output
# Date: November 2026

MyData <- read.csv("data/trees.csv", header = TRUE) # Import with headers

write.csv(MyData, "results/MyData.csv") # Write it as a new file

write.table(MyData[1, ], file = "results/MyData.csv", append = TRUE) # Append to it

write.csv(MyData, "results/MyData.csv", row.names = TRUE) # Write row names

write.table(MyData, "results/MyData.csv", col.names = FALSE) # Omit column names