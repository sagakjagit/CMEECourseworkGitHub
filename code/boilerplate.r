#!/usr/bin/env Rscript
# Author: Saga Kjällgren
# Script: boilerplate.R
# Desc: Defining and calling a function in R.
# Date: November 2026

MyFunction <- function(Arg1, Arg2) {
  # Statements involving Arg1, Arg2:
  print(paste("Argument", as.character(Arg1), "is a", class(Arg1))) 
  print(paste("Argument", as.character(Arg2), "is a", class(Arg2))) 
  return (c(Arg1, Arg2)) #this is optional, but very useful
}

MyFunction(1,2) #test the function
MyFunction("riki","Tiki") #A different test