Exponential <- function(N0 = 1, r = 1, generations = 10) {
#!/usr/bin/env Rscript
# Author: Saga Kjällgren
# Script: browse.R
# Desc: Demonstrates debugging a function using browser() breakpoints.
# Date: November 2026

  # runs a simulation of exponential growth
  # returns a vector of length generations
  N <- rep(NA, generations)    # Creates a vector of NA
  
  N[1] <- N0
  for (t in 2:generations) {
    N[t] <- N[t-1] * exp(r)
    browser()
  }
  return (N)
}

plot(Exponential(), type="l", main="Exponential growth")