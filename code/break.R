#!/usr/bin/env Rscript
# Author: Saga Kjällgren
# Script: break.R
# Desc: Demonstrates using break to exit a while loop.
# Date: October 2026

i <- 0 # Initialise i

while (i < Inf) {
  if (i == 10) {
    break # Exit the while loop
  } else {
    cat("i equals ", i, "\n")
    i <- i + 1 # Update i
  }
}