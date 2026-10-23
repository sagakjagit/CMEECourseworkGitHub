# CMEE Coursework

Coursework for Computing Bootcamp (UNIX, shell scripting, Git, Python, R).

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
- Run scripts from project root (CMEECourseWork/)
- Bash - standard UNIX tools.
- Python - standard python3 tools.
- R - dplyr, ggplot2, tidyr packages.

## Data
- '/fasta/': supplied sequence files.
- '/temperatures/': supplied comma-delimited files.
- '/tab-example.tsv': small tab-delimited test file I created.
- '/silwood_trees_raw.csv': supplied Silwood tree survey.

## Assignment 2: Silwood Tree Survey
Pseudocode:
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
Pseudocode:
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
Pseudocode:
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
Pseucode:
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