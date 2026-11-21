#!/bin/bash
# Demonstrates assigning variables and using environment variables.

greeting="Hello"
user_name=$USER
printf '%s %s\n' "$greeting" "$user_name"