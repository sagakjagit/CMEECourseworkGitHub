#!/usr/bin/env Rscript
# Author: Saga Kjällgren
# Script: next.R
# Desc: Demonstrates using next to skip iterations in a for loop.
# Date: October 2026

for (i in 1:10) {
  if ((i %% 2) == 0) {
    next # Skip even numbers
  }

  print(i)
}