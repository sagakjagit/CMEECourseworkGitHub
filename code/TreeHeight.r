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


#Load CSV trees.csv
trees <- read.csv("data/trees.csv")

#Check columns for Species, Distance.m, Angle.degrees
print(names(trees))
print(head(trees))

#Check if column names match required columns, numeric & finite & within boundary (Distance.m, Angle.degrees)
required_columns <- c("Species", "Distance.m", "Angle.degrees")
if(!(required_columns %in% names(trees))) {
    stop("Missing required columns")
}

if(!is.numeric(trees$Distance.m) || !all(is.finite(trees$Distance.m))) {
    stop("Distance.m must be numeric and finite")
}

if(!all(trees$Distance.m > 0 & trees$Distance.m <= 100)) {
    stop("Distance.m must be within boundary")
}

if(!is.numeric(trees$Angle.degrees) || !all(is.finite(trees$Angle.degrees))) {
    stop("Angle.degrees must be numeric and finite")
}

if(!all(trees$Angle.degrees > 0 & trees$Angle.degrees < 90)) {
    stop("Angle.degrees must be within boundary")
}

#Function TreeHeight to calculate height
TreeHeight <- function(degrees, distance) {
    radians <- degrees * pi / 180
    height <- distance * tan(radians)
    print(paste("Tree height is:", height))
  
    return (height)
}

#Create a new column Tree.Height.m in trees using TreeHeight function, save values in new column
trees$Tree.Height.m <- TreeHeight(trees$Angle.degrees, trees$Distance.m)

#Output TreeHts.csv in results
write.csv(trees, "results/TreeHts.csv", row.names = FALSE)