# This function calculates heights of trees given distance of each tree 
# from its base and angle to its top, using  the trigonometric formula 
#
# height = distance * tan(radians)
#
# ARGUMENTS
# degrees:   The angle of elevation of tree
# distance:  The distance from base of tree (e.g., meters)
#
# OUTPUT
# The heights of the tree, same units as "distance"


#Accept 1 readable CSV file and load trees.csv
args <- commandArgs(trailingOnly = TRUE)
if (length(args) == 0 || length(args) > 1) {
    stop("Error: Input only 1 CSV file path")
}

if(!file.exists(args[1])) {
    stop("Error: File does not exist")
}

trees <- read.csv(args[1])

#Check columns for Species, Distance.m, Angle.degrees
print(names(trees))
print(head(trees))

#Check if column names match required columns, numeric & finite & within boundary (Distance.m, Angle.degrees)
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

#Function TreeHeight to calculate height
TreeHeight <- function(Angle.degrees, Distance.m) {
    height_m <- Distance.m * tan(Angle.degrees * pi / 180)
    print(paste("Tree height is:", height_m))
    return (height_m)
}

#Create a new column Tree.Height.m in trees using TreeHeight function, save values in new column
trees$Tree.Height.m <- TreeHeight(trees$Angle.degrees, trees$Distance.m)

#Output basename_treeheights.csv
trees_basename = basename(args[1])
trees_basename <- sub(".csv$", "", trees_basename)
write.csv(trees, paste("results/", trees_basename, "_treeheights.csv", sep = ""), row.names = FALSE)


