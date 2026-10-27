# Assignment 3 formative feedback

This feedback is organised using the [Computing Bootcamp rubric](https://mulquabio.github.io/MQB/rubrics/Computing_Bootcamp_Rubric.html). It does not award a mark; use it to decide what to revise and check before final submission.

## Criterion 1: Repository organisation & workflow discipline

Before final submission, check that the required scripts are under `code/`, supplied inputs are under `data/`, and generated files remain outside Git.

## Criterion 2: Code completeness & functional correctness

- Before final submission, **Restore the two required tree-height entry points.** `code/TreeHeight.R` and `code/run_get_TreeHeight.sh` are missing at their required paths, so the fixed route and normal generalised route could not be tested. Check filenames and capitalisation: the history mentions `TreeHeight.r`, so confirm that the required `TreeHeight.R` file is present with exactly that capitalisation. Treat the fixed and generalised routes as separate programs. The fixed function’s first input should be the angle in degrees and its second the horizontal distance; its interface remains untested here. Try the taught example call and compare it with a direct calculation.
- Before final submission, **Make output creation reproducible.** The generalised R source writes into `results/` without creating it. This can prevent valid measurements reaching a saved output in a newly cloned copy of your repository, where `results/` does not yet exist. Arrange for the directory to be created when needed, then test from the directory containing `code/`, `data/` and the root `README.md`. Check that the fixed route creates `results/TreeHts.csv` and the generalised route creates `results/trees_treeheights.csv`. After restoring them, compare their outputs with the required column names and values. Add `results/` to `.gitignore` to keep future generated files out of commits.

## Criterion 3: Code quality & style

As you revise, keep names descriptive, use comments to explain decisions rather than restating code, and avoid repeating the same calculation in several places.

## Criterion 4: Documentation

- Before final submission, **Align the README with the actual commands and files.** The generalised command omits its required CSV argument, its output description adds a `_python` suffix not used by the R source, and the Pound Hill CSV/PDF descriptions are reversed. The package list also omits `reshape2`. Correct these so another person can reproduce the full route. Your README claims a `browser()` height check, but the supplied evidence does not demonstrate an independent calculation; record one measurement, your direct calculation and the comparison with the program’s result.

## Criterion 5: Version-control practice

- Your root README, supplied data and `.gitignore` are present. No generated results are tracked, and your Git history includes descriptive commits for code, data and documentation.

## Criterion 8: Basic error-handling & input validation

- In `get_TreeHeight.R`, the code shows a degrees-to-radians conversion and checks for arguments, required columns and measurement ranges. The invalid-input run stopped with a useful message about non-numeric or non-finite distance. This supports that particular rejection, not the complete generalised workflow.
- Before final submission, **Strengthen the Pound Hill count check.** In the code, `any(Count >= 0)` only establishes that at least one count is non-negative; a negative count among valid counts can escape rejection. The numeric-type check after integer conversion also cannot show that all values are finite and non-missing. These checks protect both richness and abundance summaries. Try a small diagnostic input containing one negative count and another containing a missing or non-numeric count, and check that each stops with a useful error before producing results.

## Criterion 9: Problem-solving approach & method implementation

- Your Pound Hill script ran and generated the required table and PDF. The table had the expected rows, plot identifiers and richness values. When I opened the figure, I found clear boxplots with plot-level points, an informative title and readable axes; this is separate from the automated output check.
- Your Pound Hill source explains the route from species counts to quadrat richness and then plot means. Your interpretation distinguishes richness from abundance and appropriately avoids claiming that cultivation caused the observed differences.

## Criterion 10: Learning progression demonstration

Use this feedback as a revision checklist. Make the changes in small, descriptive commits, then add a short README note explaining what you changed and how you checked it. This will make your development from this formative checkpoint visible in the final portfolio.

## Priorities before final submission

- Restore the required paths, update the README, then rerun one ordinary and one invalid case for each tree-height route. Inspect stderr alongside the exit status and confirm that invalid input produces no new result. Finally, open the Pound Hill table and PDF together and check that plotted values, labels and your biological interpretation agree.
