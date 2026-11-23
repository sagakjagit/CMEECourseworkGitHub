#!/usr/bin/env Rscript
# Author: Saga Kjällgren
# Script: try.R
# Desc: Demonstrates catching errors using try() in R.
# Date: November 2026

# Sample a population and calculate its mean
doit <- function(x) {
  temp_x <- sample(x, replace = TRUE)

  if (length(unique(temp_x)) > 30) {
    print(paste("Mean of this sample was:", as.character(mean(temp_x))))
  } else {
    stop("Couldn't calculate mean: too few unique values!")
  }
}

# Generate a synthetic population
set.seed(1345)
popn <- rnorm(50)
hist(popn)

# Repeat sampling using lapply() and try()
result <- lapply(1:15, function(i) try(doit(popn), FALSE))

# Check the result
class(result)
result

# Repeat sampling using a for loop and try()
result <- vector("list", 15)

for (i in 1:15) {
  result[[i]] <- try(doit(popn), FALSE)
}