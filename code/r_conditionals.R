#!/usr/bin/env Rscript
# Author: Saga Kjällgren
# Script: r_conditionals.R
# Desc: Demonstrates functions with conditionals and default arguments in R.
# Date: November 2026

# Checks if an integer is even
is.even <- function(n) {
  if (n %% 2 == 0) {
    return(paste(n, "is even!"))
  } else {
    return(paste(n, "is odd!"))
  }
}

is.even(6)


# Checks if an integer is even with a default value
is.even.default <- function(n = 2) {
  if (n %% 2 == 0) {
    return(paste(n, "is even!"))
  } else {
    return(paste(n, "is odd!"))
  }
}

is.even.default()
is.even.default(6)
is.even.default(n = 3)


# Rounds tree height for reporting, with a default number of decimal places
report_height <- function(height_m, digits = 2) {
  round(height_m, digits = digits)
}

report_height(12.345)
report_height(12.345, digits = 1)

report_height(8.678)
report_height(8.678, digits = 1)
report_height(digits = 1)
is.even()

# Checks if a number is a power of 2
is.power2 <- function(n) {
  if (log2(n) %% 1 == 0) {
    return(paste(n, "is a power of 2!"))
  } else {
    return(paste(n, "is not a power of 2!"))
  }
}

is.power2(4)


# Checks if a number is prime
is.prime <- function(n) {
  if (n == 0) {
    return(paste(n, "is a zero!"))
  } else if (n == 1) {
    return(paste(n, "is just a unit!"))
  }

  ints <- 2:(n - 1)

  if (all(n %% ints != 0)) {
    return(paste(n, "is a prime!"))
  } else {
    return(paste(n, "is a composite!"))
  }
}

is.prime(3)