#!/usr/bin/env Rscript
# Author: Saga Kjällgren
# Script: control_flow.R
# Desc: Demonstrates if statements, for loops and while loops. 
# Date: November 2026

# If statement
a <- TRUE

if (a) {
  print("a is TRUE")
} else {
  print("a is FALSE")
}

# If statement - with a random number
z <- runif(1)

if (z <= 0.5) {
  print("Less than a half")
}

# For loop - square numbers from 1 to 10
for (i in 1:10) {
  j <- i * i
  print(paste(i, "squared is", j))
}

# For loop - iterate over species names
for (species in c("Heliodoxa rubinoides",
                  "Boissonneaua jardini",
                  "Sula nebouxii")) {
  print(paste("The species is", species))
}

# For loop - iterate over an existing vector
v1 <- c("a", "bc", "def")

for (i in v1) {
  print(i)
}

# While loop
i <- 0

while (i < 10) {
  i <- i + 1
  print(i^2)
}