# CMEE Coursework

Coursework for Computing Bootcamp (UNIX, shell scripting, Python, R).

## Project structure
```
CMEECourseWork/
├── Feedback
├── README.md
├── code
├── data
├── sandbox
└── scratch.tmp
```

## Usage and Requirements
All scripts should be run from the root directory of the repository (CMEECourseWork/).
The following software and tools are required:
- Bash and UNIX unitilies: for shell scripts, using commands grep, tail, tr, wc and bc.
- Python3: for Python scripts. 
- R: for R scripts, with dplyr, ggplot2, tidyr packages, reshape

## In-class Scripts: code/
- (1) variables.sh
    - Contains: Demonstrates command-line arguments, variables, user input and basic arithmetic.
    - Software: Bash
    - Run: bash code/variables.sh
    - Check: Provide two arguments to test command-line inputs.

- (2) MyExampleScript.sh
    - Contains: Demonstrates variable assignment and accessing environment variables ($USER).
    - Software: Bash
    - Run: bash code/MyExampleScript.sh
    - Check: Verify that the script prints "Hello" followed by the current login name
- (3) boilerplate.sh
    - Contains: Basic Bash script structure, comments, terminal output and exit status.
    - Software: Bash
    - Run: bash code/boilerplate.sh
    - Check: Verify that the message prints correctly and the script exits with status 0.

- (4) CheckLabel.sh
    - Contains: Demonstrates if statements, conditional operators, argument validation and error.
    - Software: Bash
    - Run: bash code/CheckLabel.sh oak
    - Check: Test with 'oak', 'birch', no arguments and two arguments. Expected exit statuses: 0, 1, 2 and 2 respectively.   

- (5) CountLines.sh
    - Contains: Counts the number of lines in a specified file using wc -l.
    - Software: Bash
    - Run: bash code/CountLines.sh data/test.txt
    - Check: Run using a test text file and compare the reported line count with the file's newline count.

- (6) ConcatenateTwoFiles.sh
    - Contains: Concatenates two input files into a single output file using cat.
    - Software: Bash
    - Run: bash code/ConcatenateTwoFiles.sh
    - Input: 2 text files.
    - Output: 1 merged text file, containing both inputs in order.
    - Check: Verify output contains both file contents in correct order. Rerun to make sure it does not duplicate. 

- (7) tiff2_png.sh
    - Contains: for loop to convert TIFF images into PNG format.
    - Software: Bash and ImageMagick (magick function)
    - Run: bash code/tiff2_png.sh 
    - Inputs: TIFF images (.tif) in the current directory.
    - Outputs: PNG images (.png) saved in the current directory.
    - Check: Run on copied test images and verify that corresponding PNG files are created. 

- (8) loops.py
    - Contains: Python for and while loops, iterating through lists and calculating sums.
    - Software: Python 3
    - Run: python3 code/loops.py
    - Check: Run the script and verify that the loops produce the expected output.

- (9) cfexcercises1.py
    - Contains: 6 functions demonstrating square roots, finding maximum values, sorting numbers and calculating factorials using loops and recursion.
    - Software: Python 3,
    - Run: python3 code/cfexercises1.py
    - Inputs: Numerical arguments.
    - Outputs: Returned numerical values, and sorted lists. 
    - Check: Run functions individually and compare results against expected values.

- (10) cfexercises2.py
    - Contains: Demonstrates for and while loops, conditional statements (if/elif) and breaks.
    - Software: Python 3
    - Run: python3 code/cfexercises2.py
    - Inputs: Numerical arguments.
    - Outputs: Prints 'hello' messages to the terminal.
    - Check: Run the script and compare the number of printed messages from each function with predicted results.

- (11) MyExampleScript.py
    - Contains: Demonstrates defining and calling a Python function and printing its returned value.
    - Software: Python 3
    - Run: python3 code/MyExampleScript.py
    - Inputs: Integer 2 passed to the square() function.
    - Outputs: Prints The square of 2 is 4.
    - Check: Run the script and verify the output.

- (12) boilerplate.py
    - Contains: Demonstrates a basic Python program structure using a main function.
    - Software: Python 3
    - Run: python3 code/boilerplate.py
    - Outputs: Prints This is a boilerplate.
    - Check: Run the script and verify the output. 

- (13) using_name.py
    - Contains: Shows how '__name__' differs when a Python file is run directly or imported.
    - Software: Python 3
    - Run: python3 code/using_name.py
    - Outputs: Prints '__main__' when run directly; returns 'using_name' when imported.
    - Check: Run the script directly, and then import in IPython to compare the values of '__name__'.

- (14) sysargv.py
    - Contains: Demonstrates accessing command-line arguments using sys.argv.
    - Software: Python 3
    - Run: python3 code/sysargv.py oak 12
    - Outputs: Prints the script name, number of arguments and supplied arguments.
    - Check: Run with oak 12 and verify that two arguments are displayed: ['oak', '12'].

- (15) control_flow.py
    - Contains: Defines functions demonstrating conditionals, loops and control flow. Includes doctest examples for even_or_odd().
    - Software: Python 3
    - Run: python3 code/control_flow.py
    - Test: python3 -m doctest -v code/control_flow.py
    - Inputs: Integer arguments passed to the functions.
    - Outputs: Function return values and doctest results printed in the terminal.
    - Check: Run doctests and verify that all three examples pass.

- (16) test_control_flow.py
    - Contains: Tests count_above() using normal, boundary and empty-input cases.
    - Software: Python 3
    - Run: python3 code/test_control_flow.py
    - Inputs: [8, 12, 10, 15], [9, 10, 11] and [] with a threshold of 10.
    - Outputs: Returns expected counts of 2, 1 and 0.
    - Check: Verify all three assertions pass without errors.

- (17) (1) observations_practice.py & (2) test_observations_practice.py
    - Contains: (1) Loads, validates and summarises ecological observation data. Handles missing counts, rejects invalid values and removes duplicate records. (2) Then tests the functions in observations_practice.py, including normal cases, missing values, zero counts, invalid data and duplicate records.
    - Software: Python 3
    - Run: (1) python3 code/observations_practice.py (2) python3 code/test_observations_practice.py
    - Input: data/bootcamp_observations.csv, data/bootcamp_observations_boundary.csv, data/bootcamp_observations_invalid.csv
    - Output: Printed sample observations when running observations_practice.py, site summaries returned by summarise_site() (known totals and missing counts) and test results from test_observations_practice.py (assertions pass silently if successful). No output files are generated. 
    - Check: Run the script and confirm it finishes without errors, indicating all tests passed.

- (18) debugme.py
    - Contains: Demonstrates debugging a Python function using pdb to investigate a ZeroDivisionError.
    - Software: Python 3
    - Run: python3 code/debugme.py
    - Inputs: Integer '20'.
    - Outputs: Raises ZeroDivisionError when the divisor reaches zero.
    - Check: Run the script and confirm expected ZeroDevisionError occurs. 

- (19) basic_io.R
    - Contains: A simple R script illustrating file input and output.
    - Software: R
    - Run: Rscript code/basic_io.R
    - Inputs: data/trees.csv
    - Outputs: results/MyData.csv
    - Check: Inspect results/MyData.csv after running.

- (20) boilerplate.r
    - Contains: Defining and calling an R funciton.
    - Software: R
    - Run: Rscript code/boilerplate.R
    - Inputs: Numeric arguments 1, 2 and character arguments "riki", "Tiki".
    - Outputs: Prints argument and its type. 
    - Check: Confirm the output identifies the first pair as numeric and the second pair as character.

- (21) control_flow.R
    - Contains: R control flow using if, for and while loops.
    - Software: R
    - Run: Rscript code/control_flow.R
    - Inputs: Logical value TRUE, random number, numeric sequence 1–10 and species/character vectors.
    - Outputs: Prints conditional messages, squared numbers, species names and vector elements. 
    - Check: Confirm loops prints expected values. 

- (22) r_conditionals.R
    - Contains: Conditional functions, default arguments, rounding, checking powers and prime numbers. 
    - Software: R
    - Run: Rscript code/r_conditionals.R
    - Inputs: Example integers, tree heights and decimal-place arguments.
    - Outputs: Returns messages identifying even/odd numbers, powers of two and prime numbers and rounded tree heights.
    - Check: Confirm is.even(6) returns "6 is even!", report_height(12.345) returns 12.35, is.power2(4) identifies a power of two, and is.prime(3) identifies a prime.

- (23) break.R
    - Contains: Demonstrates using break to exit a while loop when a condition is met.
    - Software: R
    - Run: Rscript code/break.R
    - Inputs: Initial value i = 0; stopping condition i == 10.
    - Outputs: Prints values 0–9 before exiting the loop.
    - Check: Confirm the output stops at 9 and doesn't print 10.

- (24) next.R
    - Contains: Demonstrates using next to skip even numbers in a for loop.
    - Software: R
    - Run: Rscript code/next.R
    - Inputs: Numeric sequence 1–10.
    - Outputs: Prints odd numbers from 1 to 9.
    - Check: Confirm the output is 1, 3, 5, 7, 9.

- (25) try.R
    - Contains: Demonstrates catching errors using try() with lapply() and for loops
    - Software: R
    - Run: Rscript code/try.R
    - Inputs: Randomly generated population of 50 values, with seed set to 1345.
    - Outputs: A list of 15 sampling results, including successful means and caught errors and a histogram.

- (26) browse.R
    - Contains: Demonstrates debugging an exponential growth function using browser() breakpoints.
    - Software: R
    - Run: Rscript code/browse.R
    - Inputs: Initial population (N0), growth rate (r) and number of generations with defaults of 1, 1 and 10.
    - Outputs: An exponential growth plot and debugging session.
    - Check: Confirm that the exponential growth function produces an increasing population vector and that the plot displays exponential growth.

- (27) observations_practice.R
    - Contains: Reads and summarises observationd data, checks required columns and values, missing counts, duplicate rows, missing counts. Calculates known totals by site.
    - Software: R
    - Run: Rscript code/observations_practice.R
    - Inputs: data/bootcamp_observations.csv, data/bootcamp_observations_boundary.csv, data/bootcamp_observations_invalid.csv
    - Outputs: Summary of known totals and missing counts by site, plot in results/observations_summary.png.
    - Check: Run with the boundary dataset to check that site C has NA and 2 missing counts, and site D has a total of 0 and 0 missing counts. Run with the invalid dataset to check that invalid counts give an error.

- (28) data_wrang.R
    - Contains: Reshapes Pound Hill dataset from wide to long format. 
    - Software: R with reshape2 package.
    - Run: Rscript code/data_wrang.R
    - Inputs: data/pound_hill_data.csv, data/pound_hill_meta_data.csv
    - Outputs: results/pound_hill_long.csv
    - Check: Confirm the output has been reshaped and output saved to results/.

- (29) data_wrang_tidy.R
    - Contains: Loads and inspects the Pound Hill dataset, replaces blank values with zeros, and reshapes the data from wide to long format using tidyr::pivot_longer().
    - Software: R with tidyverse package.
    - Run: Rscript code/data_wrang_tidy.R
    - Inputs: data/pound_hill_data.csv, data/pound_hill_meta_data.csv
    - Outputs: results/pound_hill_long_tidy.csv
    - Check: Confirm the output has been reshaped and output saved to results/.

- (30) sql_in_r.R
    - Contains: Creates and queries a SQLite database in R. Creates a consumer table, imports resource.csv into a resource table, runs SQL queries and checks table contents.
    - Software: R; DBI and RSQLite packages.
    - Run: Rscript code/sql_in_r.R
    - Inputs: data/resource.csv
    - Outputs: results/sql_in_r.sqlite; SQL query results and database checks printed to terminal.
    - Check: Confirms that the consumer table contains 3 rows and that the resource table contains the same number of rows as the input CSV.

## Assignment 1: UNIX and Shell Scripting
## UNIX Excercise:
- (1) unixPrac1.txt
    -  Contains: Five excercises using UNIX commands to analyse FASTA sequence data.
    - Software: UNIX including commands grep, wc, tr and bc. 
    - Run: bash code/unixPrac1.txt
    - Input: All FASTA files in data/fasta/.
    - Output: (1) Number of FASTA files, (2) sequence data only, (3) length of sequence, (4) count occurences of A,T,G and C and (5) ratio of A or T to C or G. 


## Shell Scripts:
- (2) code/tabtocsv.sh 
    - Contains: Converts tab-delimited files into comma-delimited files.
    - Software: Bash
    - Run: bash code/tabtocsv.sh data/tab-example.tsv
    - Input: data/tab-example.tsv
    - Output: results/$(basename "$1").csv
    - Check: Confirm the output file is created and contains comma-delimited data.

- (3) code/csvtospace.sh 
    - Contains: Converts comma-delimited files into space-delimited files.
    - Software: Bash
    - Input: bash code/csvtospace.sh results/tab-example.tsv.csv
    - Output: results/$(basename "$1").txt
    - Check: Confirm the output file is created and contains space-delimited data

## Revisions after formative feedback:
Updated both scripts to run from repository root, and check directory creation and conversion success before printing completion. 

## Assignment 2: Silwood Tree Survey
- Input: 
- 'data/silwood_trees_raw.csv': observations containing record IDs, locations, genera, species, distances and angles. 
- ASSUMPTIONS:
    - "record_id": no whitespace, missing, duplicate, or invalid values. In the format 'ST' followed by 3 digits. 
    - "location": no whitespace, missing or invalid values. Matching a canonical location and its capitalisation. 
    - "genus" and "species": no whitespace, missing, invalid values. Matching a genus/species combination. 
    - "distance_m": no whitespace, missing, or invalid values. Must be numerical and finite value that is greater than 0 or less than or equal to 100.
    - "angle_degrees": no whitespace, missing or invalid values. Must be numerical and finite value that is greater than 0 and less than 90.
- PROCESSING:
    - Load the input CSV and check the columns as expected. 
    - Validate each row through the assumptions above, removing whitespace and standardising capitalisation where needed.
    - Accept rows with no validation errors, and record their IDs.
    - Reject rows with validation errors, and record their source row number, record IDs and reasons. 
    - Sort accepted records by record ID, and rejected records by source row.
    - Count species for accepted oak records.
- OUTPUT:
    - (1) "silwood_trees_clean.csv": Accepted and standardised records .
    - (2) "silwood_tree_issues.csv": Rejected records by source row and the reasons.
    - (3) "oak_species_counts.csv" - Accepted oak records and species count. 

## Assignment 3: Calculate Tree Heights
- Run from project root with Rscript code/TreeHeight.R
- INPUT:
    - data/trees.csv - supplied CSV containing 120 rows and 3 columns - Species, Distance.m and Angle.degrees.
- PROCESSING:
    - Load data/trees.csv.
    - CHecked required columns and valid ranges (0 < Distance.m <= 100, 0 < Angle.degrees < 90).
    - Defined TreeHeight function to calculate tree height in metres by Distance.m and Angle.degrees.
    - Add height_m to original data and save output.
- OUTPUT:
    - (1) results/TreeHts.csv - 4 columns including height_m.

## Assignment 3: Generalise Tree Heights
- Run from project root with Rscript code/get_TreeHeight.R
- INPUT:
    -  data/trees.csv - supplied CSV containing 120 rows and 3 columns - Species, Distance.m and Angle.degrees.
- PROCESSING:
    - Accept only 1 readable CSV file path through commandArgs trailingOnly = TRUE and included errors for no or extra arguments. 
    - Appended height_m to original columns of trees.csv.
    - Generate output filename from input basename and save in results/.
    - Used browser() to inspect and verify height calculation.
- OUTPUT:
    - (1) results/<input-basename-without-.csv>_treeheights_python.csv.

## Assignment 3: Pound Hill Cultivation & Species Richness
 - Run from project root with Rscript code/pound_hill_analysis.R
- INPUT:
    - data/pound_hill_data.csv - Cultivation, Block, Plot, Quadrat, Species and Count.
    - data/pound_hill_meta_data.csv - supplied metadata.
- PROCESSING:
    - Load input data and required packages. 
    - Transposed raw Pound Hill data and replaced blank values with zero. 
    - Reshaped data from wide to long format using melt().
    - Converted identifires to factors and species counts to integers. 
    - Checked counts are finite and non-negative.
    - Calculated species richness per quadrat, then mean richness per plot, and the same for abundance of species. 
    - Compared species richness and abundance per plor across three cultivation treatments.
- OUTPUT:
    - (1) results/pound_hill_plot_richness.pdf - table of Cultivation, Block, Plot and MeanRichness.
    - (2) results/pound_hill_plot_richness.csv - plot mean species richness by cultivation treatment. 

## AI use
- Tool: Claude - explaining commands (`>&2`, 'key=lamda', '.isdigit()', 'math.isfinite()', 'for .. in ...', 'sub', 'paste', 'any' vs 'all', 'floor'), interpreting error messages, help with shell quoting, test suggestions, syntaxing (elif, else, if, not), understanding (list/tuple/dictionaries), process functions. 
- Resources: Stack Overflow - understand commands (such as `tr -d`, `bc -l`, `\n`, 'utf-8').


## Authors
- Saga Kjallgren slk26@ic.ac.uk