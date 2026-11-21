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
- R: for R scripts, with dplyr, ggplot2, tidyr packages.

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
    - Software: Python 3, ipython
    - Run: %run code/cfexercises1.py
    - Inputs: Numerical arguments.
    - Outputs: Returned numerical values, and sorted lists. 
    - Check: Run functions individually and compare results against expected values.

## Assignment 1: UNIX and Shell Scripting
## UNIX Excercise:
code/unixPrac1.txt contains five exercises using UNIX commands to analyse FASTA sequence data:
- Count Fasta files.
- Display sequence data only.
- Calculate sequence length. 
- Count occurences of ATGC.
- Calculate ratio of A and T to G and C.
## Shell Scripts:
(1) code/tabtocsv.sh converts tab-delimited files into comma-delimited files.

INPUT:
- code/tabtocsv.sh
- data/tab-example.tsv

OUTPUT:
- results/$(basename "$1").csv

(2) code/csvtospace.sh converts comma-delimited files into space-delimited files.

INPUT:
- code/csvtospace.sh
- results/tab-example.tsv.csv

OUTPUT:
- results/$(basename "$1").txt

## Revisions after formative feedback:
Updated both scripts to run from repository root, and check directory creation and conversion success before printing completion. 

## Assignment 2: Silwood Tree Survey
- INPUT: 
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
- Tool: Claude - explaining commands (`>&2`, 'key=lamda', '.isdigit()', 'math.isfinite()', 'for .. in ...', 'sub', 'paste', 'any' vs 'all'), interpreting error messages, help with shell quoting, test suggestions, syntaxing (elif, else, if, not), understanding (list/tuple/dictionaries), process functions. 
- Resources: Stack Overflow - understand commands (such as `tr -d`, `bc -l`, `\n`, 'utf-8').

## Authors
- Saga Kjallgren slk26@ic.ac.uk