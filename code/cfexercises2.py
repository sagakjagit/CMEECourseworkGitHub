#!/usr/bin/env python3
# Author: Saga Kjällgren
# Script: cfexercises2.py
# Desc: Loops, conditional statements and break in Python.
# Arguments: None.
# Date: November 2026

######################## 
def hello_1(x):
    for j in range(x):
        if j % 3 == 0: #if j divisible by 3, i.e. remainder 0
            print('hello')
    print(' ')

hello_1(12) #range from 0 to 11

########################
def hello_2(x):
    for j in range(x):
        if j % 5 == 3: #what gives remainder 3
            print('hello')
        elif j % 4 == 3: #do this if not
            print('hello')
    print(' ')

hello_2(12) #range 0 to 11 NOT 12, prints hello 4 times

########################
def hello_3(x, y):
    for i in range(x, y):
        print('hello')
    print(' ')

hello_3(3, 17)

########################
def hello_4(x):
    while x != 15: #keep doing while x not equal to 15
        print('hello')
        x = x + 3
    print(' ')

hello_4(0) #dont make it 1 LOL or it will run forever!

########################
def hello_5(x):
    while x < 100:
        if x == 31:
            for k in range(7):
                print('hello')
        elif x == 18:
            print('hello')
        x = x + 1
    print(' ')

hello_5(12)

# WHILE loop with BrEAK
def hello_6(x, y):
    while x: # while x is True
        print("hello! " + str(y))
        y += 1 # increment y by 1 
        if y == 6:
            break
    print(' ')

hello_6 (True, 0)