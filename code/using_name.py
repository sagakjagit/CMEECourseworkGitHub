#!/usr/bin/env python3
# Author: Saga Kjällgren
# Script: using_name.py
# Desc: Demonstrates the value of __name__ when running or importing a module.
# Date: October 2026

"""Demonstrate the value Python assigns to __name__."""


def module_name():
    """Return the name Python assigned to this module."""
    return __name__

def main():
    """Report the module name during direct execution."""
    print(f"This module's name is: {module_name()}")

if __name__ == "__main__":
    main()