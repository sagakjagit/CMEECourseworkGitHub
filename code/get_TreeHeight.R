#!/usr/bin/env Rscript
# Author: Saga Kjällgren
# Script: get_TreeHeight.R
# Desc: Calculates tree heights from distance and angle measurements using trigonometry.
# Date: November 2026


# Accept one CSV file path as a command-line argument
args <- commandArgs(trailingOnly = TRUE)
if (length(args) != 1) {
    stop("Error: Input only 1 CSV file path")
}

if(!file.exists(args[1])) {
    stop("Error: File does not exist")
}

if (file.access(args[1], 4) != 0) {
    stop("Error: File is not readable")
}

trees <- read.csv(args[1])

# Check if column names match required columns, numeric & finite & within boundary
# for Distance.m and Angle.degrees
required_columns <- c("Species", "Distance.m", "Angle.degrees")
if(!all(required_columns %in% names(trees))) {
    stop("Error: Missing required columns")
}

if(!is.numeric(trees$Distance.m) || !all(is.finite(trees$Distance.m))) {
    stop("Error: Distance.m must be numeric and finite")
}

if(!all(trees$Distance.m > 0 & trees$Distance.m <= 100)) {
    stop("Error: Distance.m must be within boundary")
}

if(!is.numeric(trees$Angle.degrees) || !all(is.finite(trees$Angle.degrees))) {
    stop("Error: Angle.degrees must be numeric and finite")
}

if(!all(trees$Angle.degrees > 0 & trees$Angle.degrees < 90)) {
    stop("Error: Angle.degrees must be within boundary")
}

# Function TreeHeight to calculate height
TreeHeight <- function(Angle.degrees, Distance.m) {
    height_m <- Distance.m * tan(Angle.degrees * pi / 180)
    return(height_m)
}

# Create a new column Tree.Height.m in trees using TreeHeight function, save values in new column
trees$Tree.Height.m <- TreeHeight(trees$Angle.degrees, trees$Distance.m)

# Create results directory and save output using the input filename
dir.create("results", showWarnings = FALSE)
trees_basename <- sub("\\.csv$", "", basename(args[1]))
write.csv(trees, paste0("results/", trees_basename, "_treeheights.csv"), row.names = FALSE)


