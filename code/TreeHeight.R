# Author: Saga Kjällgren
# Script: TreeHeight.R
# Desc: Calculates tree heights from distance and angle degrees using trigonometry.
# Date: November 2026

# Load the tree measurements from the CSV file
trees <- read.csv("data/trees.csv")

#Check required columns for Species, Distance.m, Angle.degrees
required_columns <- c("Species", "Distance.m", "Angle.degrees")

if(!all(required_columns %in% names(trees))) {
    stop("Missing required columns")
}

# Check that distance measurements are numeric, finite and within the expected range
if(!is.numeric(trees$Distance.m) || !all(is.finite(trees$Distance.m))) {
    stop("Distance.m must be numeric and finite")
}

if(!all(trees$Distance.m > 0 & trees$Distance.m <= 100)) {
    stop("Distance.m must be within boundary")
}

# Check that angle measurements are numeric, finite and between 0 and 90 degrees
if(!is.numeric(trees$Angle.degrees) || !all(is.finite(trees$Angle.degrees))) {
    stop("Angle.degrees must be numeric and finite")
}

if(!all(trees$Angle.degrees > 0 & trees$Angle.degrees < 90)) {
    stop("Angle.degrees must be within boundary")
}

# Define function to calculate tree height from angle degrees and distance
TreeHeight <- function(Angle.degrees, Distance.m) {
    height_m <- Distance.m * tan(Angle.degrees * pi / 180)
    print(paste("Tree height is:", height_m))
    return(height_m)
}

# Create a new column 
trees$Tree.Height.m <- TreeHeight(trees$Angle.degrees, trees$Distance.m)

# Create the results directory if it does not already exist
dir.create("results", showWarnings = FALSE)

# Output TreeHts.csv in results
write.csv(trees, "results/TreeHts.csv", row.names = FALSE)



