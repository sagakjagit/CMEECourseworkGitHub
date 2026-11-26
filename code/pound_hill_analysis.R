#!/usr/bin/env Rscript
# Author: Saga Kjällgren
# Script: pound_hill_analysis.R
# Desc: Mean plant species richness over Pound Hill treatment
# Date: November 2026


# Load the data and packages ----------------------------------------------

library(tidyr)
library(dplyr)
library(ggplot2)
library(reshape2)

MyData <- as.matrix(read.csv("data/pound_hill_data.csv", header = FALSE))
MyMetaData <- read.csv("data/pound_hill_meta_data.csv", header = TRUE, sep = ";")

# Transpose data to flip columns and rows---------------------------------
MyData <- t(MyData)

# Inspect the data -------------------------------------------------------
head(MyData) # Inspect first few rows
dim(MyData) # Inspect dimensions
str(MyData)
head(MyMetaData) # Inspect meta data 

# In this dataset blanks are '0' observations, rather than NA-------------
MyData[MyData == ""] <- 0

# Convert the raw matrix to a data frame ---------------------------------
TempData <- as.data.frame(MyData[-1, ], stringsAsFactors = FALSE)
colnames(TempData) <- MyData[1, ]
rownames(TempData) <- NULL

# Convert from wide to long form -----------------------------------------
MyWrangledData <- melt(
  TempData,
  id = c("Cultivation", "Block", "Plot", "Quadrat"),
  variable.name = "Species",
  value.name = "Count"
)

MyWrangledData[, "Cultivation"] <- as.factor(MyWrangledData[, "Cultivation"])
MyWrangledData[, "Block"] <- as.factor(MyWrangledData[, "Block"])
MyWrangledData[, "Plot"] <- as.factor(MyWrangledData[, "Plot"])
MyWrangledData[, "Quadrat"] <- as.factor(MyWrangledData[, "Quadrat"])

str(MyWrangledData)
head(MyWrangledData)
dim(MyWrangledData)

# Check counts are numeric and non-negative. -----------------------------
MyWrangledData$Count <- as.numeric(MyWrangledData$Count)

if (any(is.na(MyWrangledData$Count))) {
    stop("Error: Count contains missing or non-numeric values")
}

if (any(!is.finite(MyWrangledData$Count))) {
    stop("Error: Count contains non-finite values")
}

if (any(MyWrangledData$Count < 0)) {
    stop("Error: Count cannot contain negative values")
}

if (any(MyWrangledData$Count != floor(MyWrangledData$Count))) {
    stop("Error: Count must contain whole numbers")
}

MyWrangledData$Count <- as.integer(MyWrangledData$Count)

# Count number of Species, Quadrats and Plots. ---------------------------
length(unique(MyWrangledData$Species))
nrow(unique(MyWrangledData [, c("Cultivation", "Block", "Plot", "Quadrat")]))

# Make a quadrat-level table: Cultivation, Block, Plot, Quadrat & Richness
# Richness is number of species with a count greater than 0
MyQuadratData <- MyWrangledData %>%
group_by(Cultivation, Block, Plot, Quadrat) %>%
summarise(Richness = sum(Count > 0))


# Make a plot-level summary: Cultivation, Block, Plot & MeanRichness-------
MyPlotData <- MyQuadratData %>%
group_by(Cultivation, Block, Plot) %>%
summarise(MeanRichness = mean(Richness))

# Save plot level table ---------------------------------------------------
# Plot mean species richness across 3 cultivation treatments---------------
dir.create("results", showWarnings = FALSE)
write.csv(MyPlotData, "results/pound_hill_plot_richness.csv", row.names = FALSE)

p <- ggplot(MyPlotData, aes(x = Cultivation, y = MeanRichness)) +
  geom_boxplot(outlier.shape = NA) +
  geom_point(size = 2) +
    xlab("Cultivation treatment") +
    ylab("Mean plant species richness per plot") +
    ggtitle("Plant Species Richness By Cultivation Treatment")
ggsave("results/pound_hill_plot_richness.pdf", plot = p, width = 6, height = 5)

# Figure interpretation: Mean species richness per plot across cultivation treatments
# May had the highest median species richness per plot (9.8), compared
# with March (7.5) and October (6.9). Variability among plots differed
# between treatments: May and March had IQRs of around 2.3 and 2.5
# respectively, while October had the narrowest spread (IQR 1.1).
# As there were only 4 plots per treatment and no statistical test was
# run, we cannot conclude that cultivation treatment caused these
# differences. Other factors, such as soil conditions or plot position,
# may also have influenced the results.

# Calculate abundance: sum of all species counts in each quadrat ---------
MyQuadratAbundance <- MyWrangledData %>%
  group_by(Cultivation, Block, Plot, Quadrat) %>%
  summarise(Abundance = sum(Count))

# Mean abundance per plot ------------------------------------------------
MyPlotAbundance <- MyQuadratAbundance %>%
  group_by(Cultivation, Block, Plot) %>%
  summarise(MeanAbundance = mean(Abundance))

# Compare mean abundance and species richness across cultivation treatments 
pdf("results/pound_hill_richness_abundance.pdf", width = 10, height = 5)

par(mfrow = c(1, 2))
boxplot(MeanRichness ~ Cultivation, data = MyPlotData,
        xlab = "Cultivation treatment",
        ylab = "Mean plant species richness per plot",
        main = "Species Richness")

boxplot(MeanAbundance ~ Cultivation, data = MyPlotAbundance,
        xlab = "Cultivation treatment",
        ylab = "Mean plant abundance per plot",
        main = "Plant Abundance")

dev.off()

# Interpretation comparing richness with abundance ----------------------
# October had the lowest median richness but the highest median abundance.
# This suggests that fewer species were present, but there were more
# individual plants overall, possibly because a few species were
# particularly abundant. May had higher median richness than March,
# but their abundances appeared quite similar. These differences show
# that richness and abundance provide different information about
# vegetation communities.
