# CMEE Coursework

Coursework for Computing Bootcamp (UNIX, shell scripting, Git, Python).

## Project structure
CMEECourseWork/
├── code/       # Scripts and answers
├── data/       # Supplied input files
├── results/    # Generated outputs (not committed)
├── sandbox/    # Disposable tests (not committed)
└── README.md   # Project documentation

## Usage and Requirements
- Run scripts from project root (CMEECourseWork/)
- Bash - standard UNIX tools.
- Python - standard python3 tools.

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

## AI use
- Tool: Claude - explaining commands (`>&2`, 'key=lamda', '.isdigit()', 'math.isfinite()', 'for .. in ...' ), interpreting error messages, help with shell quoting, test suggestions, syntaxing (elif, else, if, not), understanding (list/tuple/dictionaries), process functions. 
- Resources: Stack Overflow - understand commands (such as `tr -d`, `bc -l`, `\n`, 'utf-8').

## Authors
- Saga Kjallgren slk26@ic.ac.uk