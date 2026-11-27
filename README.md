# CMEE Coursework

Coursework for Computing Bootcamp (UNIX, shell scripting, Python, R).

## Project structure
```
CMEECourseWork/
├── Feedback
├── README.md
├── code
├── data
├── results
├── sandbox
└── scratch.tmp 
```

## Usage and Requirements
All scripts should be run from the root directory of the repository (CMEECourseWork/).
The following software and tools are required:
- Bash and UNIX unitilies: for shell scripts, using commands grep, tail, tr, wc and bc.
- Python3: for Python scripts, with standard library modules including csv, math, pathlib and typing.
- R: for R scripts, including dplyr, ggplot2, tidyr, reshape.
- ImageMagick: Required for tiff2_png.sh to convert TIFF images to PNG format using magick.


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

- (9) cfexercises1.py
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

- (20) boilerplate.R
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
    - Run: Run: source("code/browse.R") in an interactive R session.
    - Inputs: Initial population (N0), growth rate (r) and number of generations with defaults of 1, 1 and 10.
    - Outputs: An exponential growth plot and debugging session.
    - Check: Step through the function using the browser() breakpoint, inspect the variables and verify that the exponential growth function produces an increasing population vector and plot.

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
### UNIX Excercise:
- (1) unixPrac1.txt
    -  Contains: Five excercises using UNIX commands to analyse FASTA sequence data.
    - Software: UNIX including commands grep, wc, tr and bc. 
    - Run: Execute the five UNIX exercises individually from the repository root using the commands provided in code/unixPrac1.txt
    - Input: All FASTA files in data/fasta/.
    - Output: (1) Number of FASTA files, (2) sequence data only, (3) length of sequence, (4) count occurences of A,T,G and C and (5) ratio of A or T to C or G. 


### Shell Scripts:
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

### Revisions after formative feedback:
Updated both scripts to run from repository root, and check directory creation and conversion success before printing completion. 


## Assignment 2: Silwood Tree Survey
### clean_silwood_trees.py
- Contains: Validates and cleans the Silwood tree survey data, separates accepted and rejected records, and summarises accepted oak species.
- Software: Python 3
- Run: python3 code/clean_silwood_trees.py
- Test: python3 code/test_silwood_trees.py
- Input: data/silwood_trees_raw.csv, containing record IDs, locations, genera, species, distances and angles. data/silwood_trees_metadata.md, describing the dataset and its variables.
- Validation: Checks that:
    1. Record IDs follow the format ST followed by three digits and are not duplicated.
    2. Locations match the permitted locations.
    3. Genus and species are valid permitted combinations.
    4. Distances are finite numerical values greater than 0 and up to and including 100 metres.
    5. Angles are finite numerical values greater than 0 and less than 90 degrees.
- Processing: Standardises capitalisation, accepts records with no validation errors, and records rejected rows with their source row number, record ID and rejection reasons. Accepted records are sorted by record ID and rejected records by source row.
- Outputs: Three CSV files saved in results/:
    1. silwood_trees_clean.csv – accepted and standardised records.
    2. silwood_tree_issues.csv – rejected records and their validation reasons.
    3. oak_species_counts.csv – species counts for accepted oak records.

### test_silwood_trees.py
- Contains: Tests the validation, processing and oak summarising functions in clean_silwood_trees.py.
- Software: Python 3
- Run: python3 code/test_silwood_trees.py
- Inputs: Test records defined within the test script; no external input files required.
- Checks: Tests valid and invalid records, including record IDs, locations, genus/species combinations, distances and angles. Also checks that process_records() separates accepted and rejected records correctly, and that summarise_oaks() counts only accepted oak records.
- Output: Prints test progress and confirmation messages to the terminal. Assertions identify failures if any checks do not pass.

### Revisions after formative feedback:
- Restored the supplied data/silwood_trees_metadata.md file.
- Updated test_silwood_trees.py with additional assertions to check that valid and invalid records are correctly separated by process_records().
- Added checks to confirm that rejected records do not contribute to the oak species summary produced by summarise_oaks().
- Updated the README with instructions for running the cleaning script and tests, descriptions of the validation process, and details of the three output files.


## Assignment 3: Calculate Tree Heights
### TreeHeight.R
- Contains: Reads tree measurements from a CSV file, validates the input data and calculates tree heights using trigonometry.
- Software: R
- Run: Rscript code/TreeHeight.R
- Input: data/trees.csv, containing 120 tree records with Species, Distance.m and Angle.degrees columns.
- Processing: Checks that required columns are present and validates that distances and angles are numeric, finite and within the permitted ranges. Defines the TreeHeight() function, converts angles from degrees to radians and calculates tree heights. Adds the calculated heights as a new height_m column. Creates the results directory if it does not already exist.
- Output: results/TreeHts.csv, containing the original three columns and the calculated tree heights.
- Check: Checked the output contains 120 records and four columns. Independently calculated a tree height using the trigonometric formula and compared it with the corresponding output value. Tested invalid measurements and missing columns to check that the script stops with appropriate error messages.

### Revisions after formative feedback:
- Corrected the filename to code/TreeHeight.R.
- Added automatic creation of the results/ directory.
- Checked the function argument order and tree-height calculation.
- Removed unnecessary printing from the function.
- Added input validation for missing columns, non-numeric values, non-finite values and measurements outside the permitted ranges.

## Assignment 3: Generalise Tree Heights
### get_TreeHeight.R
- Contains: Reads a CSV file supplied as a command-line argument, validates the input data and calculates tree heights using trigonometry.
- Software: R
- Run: Rscript code/get_TreeHeight.R data/trees.csv
- Input: A CSV file containing Species, Distance.m and Angle.degrees columns.
- Processing: Checks that exactly one input file is provided and that the file exists and is readable. Checks that required columns are present and validates that distances and angles are numeric, finite and within the permitted ranges. Defines the TreeHeight() function, converts angles from degrees to radians and calculates tree heights. Adds the calculated heights as a new Tree.Height.m column. Creates the results directory if it does not already exist.
- Output: results/trees_treeheights.csv, containing the original three columns and the calculated tree heights.
- Check: Test invalid and valid arguments for appropriate error messages, expected columns and calculated heights. 

### run_get_TreeHeight.sh
- Contains: Runs the generalised tree-height R script using the supplied CSV input
- Software: Bash, R
- Run: bash code/run_get_TreeHeight.sh
- Input: data/trees.csv
- Processing: Calls get_TreeHeight.R with data/trees.csv as the command-line argument. Stops if the R command fails.
- Output: results/trees_treeheights.csv, generated by get_TreeHeight.R.
- Check: Ran the shell script from the repository root and checked that the expected output was generated. Confirmed that the shell script stops if the R command fails.

### Revisions after formative feedback:
- Generalised the script to accept a CSV file path as a command-line argument rather than using a fixed input file.
- Added checks for the number of arguments and file readability and automatic creation of the results/ directory.
- Removed unnecessary printing from the function.
- Added input validation for invalid data.
- Created a shell wrapper to run the generalised tree-height script from the repository root.

## Assignment 3: Pound Hill Cultivation & Species Richness

### pound_hill_analysis.R

- Contains: Analyses plant species richness and abundance across three cultivation treatments at Pound Hill.
- Software: R, with dplyr, ggplot2 and reshape2.
- Run: Rscript code/pound_hill_analysis.R
- Inputs: data/pound_hill_data.csv – cultivation, block, plot, quadrat and species count data. data/pound_hill_meta_data.csv` – supplementary metadata.
- Processing:
    - Loads, transposes and inspects the raw data.
    - Replaces blank cells with zero observations.
    - Reshapes the data from wide to long format using `melt()`.
    - Converts plot identifiers to factors and validates species counts.
    - Calculates species richness per quadrat and mean richness per plot.
    - Calculates total abundance per quadrat and mean abundance per plot.
    - Compares richness and abundance across the three cultivation treatments.
- Outputs:
    - results/pound_hill_plot_richness.csv – mean species richness per plot.
    - results/pound_hill_plot_richness.pdf – boxplot of species richness across treatments.
    - results/pound_hill_richness_abundance.pdf – side-by-side boxplots comparing richness and abundance.


### Revisions after Formative Feedback:
- Corrected the negative-count validation so that negative values are detected properly.
- Added checks for missing, non-finite, negative and non-whole-number counts before converting them to integers.
- Ensured the `results/` directory is created before saving output files.
- Saved the richness and abundance comparison as a PDF.
- Improved comments and interpretation to distinguish species richness from abundance and avoid unsupported causal conclusions.

## AI use
- Tool: Claude - explaining commands (`>&2`, 'key=lamda', '.isdigit()', 'math.isfinite()', 'for .. in ...', 'sub', 'paste', 'any' vs 'all', 'floor'), interpreting error messages, help with shell quoting, test suggestions, syntaxing (elif, else, if, not), understanding (list/tuple/dictionaries), process functions. 
- Resources: Stack Overflow - understand commands (such as `tr -d`, `bc -l`, `\n`, 'utf-8').


## Authors
- Saga Kjallgren slk26@ic.ac.uk