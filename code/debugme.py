#!/usr/bin/env python3
# Author: Saga Kjällgren
# Script: debugme.py
# Desc: Demonstrates debugging Python function using pdb.
# Date: November 2026

def buggyfunc(x):
    y = x
    for i in range(x):
        try:
            y = y-1
            # import ipdb; ipdb.set_trace()
            # breakpoint()
            z = x/y
        except ZeroDivisionError:
            print(f"The result of dividing a number by zero is undefined")
        except:
            print(f"This didn't work;{x = }; {y = }")
        else:
            print(f"OK; {x = }; {y = }; {z = }")
    return z

buggyfunc(20)