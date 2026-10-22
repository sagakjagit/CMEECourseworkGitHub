# Assignment 2 formative feedback

This feedback is organised by the relevant computing bootcamp criteria. Use it to decide what is already working, what you need to investigate, and what to revise before the cumulative submission.

The full criteria are in the [Computing Bootcamp assessment rubric](https://github.com/MulQuaBio/MQB/blob/main/content/rubrics/Computing_Bootcamp_Rubric.md).

## 1. Repository organisation and workflow discipline

- Your cleaning script, test script, raw CSV, root README and `.gitignore` are in the expected locations, but `data/silwood_trees_metadata.md` is missing. Restore the supplied metadata file and keep it unchanged.

## 2. Code completeness and functional correctness

- The cleaning workflow completed and produced all three files. Separately, output checks found that the clean table, issues table and oak summary satisfied their required output format and contents in both test runs. The outputs are correct for the checked input; now make sure you can explain how your functions produce them.
- Restore the metadata, add the valid/invalid-record assertions to your test file, then run your tests and cleaning workflow again. Check that your README explains how to run both and where the three outputs are written.

## 3. Code quality and style

- Your `main()` function gives the program a clear overall structure by connecting loading, processing, summarising and writing. Keep these stages distinct as you revise; use descriptive names and add short comments where the reason for a validation check or data-cleaning step is not obvious.

## 4. Documentation

- Your root README is in place. Make it useful to someone opening the repository for the first time: explain what the cleaner does, how to run the script and tests from the repository root, and which three files it creates. Test the instructions in a newly cloned copy of your repository (a separate folder created with `git clone`): enter that folder and run each README command exactly as written. If something fails, correct the command or add the missing step.

## 5. Version-control practice

- Since the previous formative feedback was added, the saved history contains 12 non-merge commits. The history shows validation, processing and tests being developed across several commits. Messages such as `Add angle_degrees validation` are informative, while repeated `Finalising...` messages are less clear about the actual change.
- Before each commit, run `git diff --staged` to see exactly what will be recorded. Keep one coherent, working change per commit and write a concise message that names what changed—for example, the validation rule added, the failing test fixed or the README instruction clarified.

## 8. Basic error handling and input validation

- Your separate test file is present and ran successfully. Your test file includes assertion-style checks covering record validation, accepted/rejected partitioning and the oak summary—a useful foundation for regression testing.
- **Check the reach of your tests.** Their successful exit does not show that every important case is covered. Compare the existing assertions against the brief’s validation and boundary rules; add a focused assertion for any uncovered rule, checking the returned data rather than only that execution completes.

## 9. Problem-solving approach and method implementation

- Your supplied raw CSV is unchanged. Your code shows a connected workflow: `main()` calls `load_records()`, passes the rows to `process_records()`, which uses `validate_record()` and returns `(clean_records, issues)`, then sends the cleaned records to `summarise_oaks()`. Three calls to `write_csv()` write the results. This makes the main steps visible; the route from input to outputs is clear in that inspection.
- Before final submission, make this check visible in your repository. In `code/test_silwood_trees.py`, add or refine a small assertion-based test with one valid and one invalid record. Check that `process_records()` places them in the cleaned and issues collections respectively. Then pass the returned cleaned collection to `summarise_oaks()` and check that the invalid record does not contribute. Briefly explain this flow in your root README.
