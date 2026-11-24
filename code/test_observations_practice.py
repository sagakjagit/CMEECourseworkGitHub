#!/usr/bin/env python3
# Author: Saga Kjällgren
# Script: test_observations_practice.py
# Desc: Tests observation loading, validation and summarising functions.
# Date: November 2026

from observations_practice import load_observations, parse_count, summarise_site

# Normal case: ordinary count text becomes an integer.
assert parse_count("2") == 2

# Boundary case: zero is a valid known count.
assert parse_count("0") == 0

# Special valid case: blank text represents a missing count.
assert parse_count("") is None

# Failure cases: each invalid value must raise ValueError.
for bad_count in ["-1", "many", 2]:
    try:
        parse_count(bad_count)
    except ValueError:
        pass
    else:
        raise AssertionError(f"Invalid count accepted: {bad_count!r}")

# Known counts in valid, unique rows
unique_rows = [
    {"site": "A", "date": "2026-10-01", "count": "2"},
    {"site": "A", "date": "2026-10-02", "count": "3"},
    {"site": "B", "date": "2026-10-01", "count": "9"},
]
assert summarise_site(unique_rows, "A") == (5, 0)

# Missing counts and observed zeros
missing_rows = [
    {"site": "C", "date": "2026-10-01", "count": ""},
    {"site": "C", "date": "2026-10-02", "count": ""},
]
zero_rows = [{"site": "D", "date": "2026-10-01", "count": "0"}]
assert summarise_site(missing_rows, "C") == (None, 2)
assert summarise_site(zero_rows, "D") == (0, 0)
assert summarise_site([], "A") == (None, 0)
assert summarise_site(unique_rows, "Z") == (None, 0)

# Exact duplicate records
assert summarise_site(unique_rows + [unique_rows[0]], "A") == (5, 0)
assert summarise_site(missing_rows + [missing_rows[0]], "C") == (None, 2)

# Validation before filtering or deduplication
rows = load_observations("data/bootcamp_observations.csv")
assert summarise_site(rows, "A") == (2, 1)
assert summarise_site(rows, "B") == (0, 0)

boundary_rows = load_observations("data/bootcamp_observations_boundary.csv")
assert summarise_site(boundary_rows, "C") == (None, 2)
assert summarise_site(boundary_rows, "D") == (0, 0)
assert summarise_site(rows, "Z") == (None, 0)

# The invalid file has two rows, which must be checked separately.
# Requesting A must still reject the invalid B row
def expect_summary_error(rows, site="A"):
    try:
        summarise_site(rows, site)
    except ValueError:
        pass
    else:
        raise AssertionError("Expected ValueError, but the call succeeded")

invalid_rows = load_observations("data/bootcamp_observations_invalid.csv")
for invalid_row in invalid_rows:
    expect_summary_error([invalid_row])

expect_summary_error([{"site": "A", "count": "2"}])
expect_summary_error([{"site": "A", "date": "2026-10-01", "count": "2", "extra": "x"}])
expect_summary_error([{"site": "", "date": "2026-10-01", "count": "2"}])
expect_summary_error([{"site": "A", "date": "", "count": "2"}])
expect_summary_error([{"site": "A", "date": "2026-10-01", "count": 2}])
expect_summary_error(["not a row dictionary"])
expect_summary_error(None)
expect_summary_error(rows, "")
expect_summary_error(rows, 2)

# Confirm input rows unchanged, and copy dictionaries

original_rows = [row.copy() for row in rows]
summarise_site(rows, "A")
assert rows == original_rows