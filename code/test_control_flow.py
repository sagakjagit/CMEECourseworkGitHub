#!/usr/bin/env python3
# Author: Saga Kjällgren
# Script: test_control_flow.py
# Desc: Tests the count_above() function using assertions.
# Date: November 2026

from control_flow import count_above


# Normal case: some values are above the threshold.
assert count_above([8, 12, 10, 15], 10) == 2

# Boundary case: values immediately below, at and above the threshold.
assert count_above([9, 10, 11], 10) == 1

# Edge case: there are no observations to count.
assert count_above([], 10) == 0