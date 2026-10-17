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


#Load CSV data trees
trees <- read.csv("data/trees.csv")

#Function
TreeHeight <- function(degrees, distance) {
    radians <- degrees * pi / 180
    height <- distance * tan(radians)
    print(paste("Tree height is:", height))
  
    return (height)
}

#Calculate height of every tree and add as new column, $ means give me column
trees$Tree.Height.m <- TreeHeight(trees$Angle.degrees, trees$Distance.m)

#Output file in CSV file in results
write.csv(trees, "results/TreeHts.csv", row.names = FALSE)