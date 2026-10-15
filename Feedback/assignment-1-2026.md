# Assignment 1 feedback - Saga Kjallgren

**Formative feedback | Rubric 2026.2**

Your five FASTA answers matched the independent checks. The converters also have clearly separated argument, file and readability checks, with errors sent to stderr. The small TSV includes an empty field, which is a useful test of whether the substitution preserves the table's structure.

The remaining converter problem is reliability from the required starting directory. Both scripts write through ../results, so they depend on being launched inside code/. Make them work from the repository root and check directory creation and conversion before printing Done. At present, reaching the final line can still produce a success status after an earlier operation has failed.

Keep the simple delimiter replacement; there is no need to turn this exercise into a full CSV parser. Instead, test what the brief actually asks for: the correct output location and contents, empty fields, a spaced filename, repeated runs and sensible errors for invalid input.

There are a few explanation and documentation corrections too. [AT] counts A or T individually, and [CG] counts C or G; neither means a two-base sequence. The README's statement that no extra tools are needed overlooks bc in Q5. Add exact commands and test results, complete the dated help record and ignore generated results as well as sandbox. Your descriptive revision history is useful; make the next commits record these specific corrections.

---

## Project structure

Relevant tracked layout (simplified; missing required paths are marked):

```text
README.md
.gitignore
code/  unixPrac1.txt, tabtocsv.sh, csvtospace.sh
data/fasta/  3 required files present
data/temperatures/  4 required files present
data/tab-example.tsv
results/  no files tracked; generated on run
sandbox/  no files tracked; optional
```

The required root files, all three assessed code files and all input paths are present. No generated outputs or sandbox files are tracked, and sandbox is already ignored. The code/data separation does not need a wholesale reorganisation.

Add an explicit results ignore rule and keep output creation inside the repository. The remaining structural improvement is to make the README's run examples agree with the actual root-based converter interface, so someone can follow the layout without first guessing a working directory.

**Assessed snapshot:** `a7945beadaf86472825602318ed4df46fbeeada2`
