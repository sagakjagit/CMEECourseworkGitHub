#!/usr/bin/env python3
"""Validate and clean the synthetic Silwood tree survey."""

from __future__ import annotations

import csv
from pathlib import Path
from typing import Iterable


PROJECT_ROOT = Path(__file__).resolve().parents[1]
INPUT_PATH = PROJECT_ROOT / "data" / "silwood_trees_raw.csv"
RESULTS_DIR = PROJECT_ROOT / "results"

INPUT_FIELDS = [
    "record_id",
    "location",
    "genus",
    "species",
    "distance_m",
    "angle_degrees",
]
ISSUE_FIELDS = ["source_row", "record_id", "reasons"]
OAK_COUNT_FIELDS = ["species", "count"]


def load_records(path: Path = INPUT_PATH) -> list[dict[str, str]]:
    """Load survey records and check that the published columns are present."""
    with path.open(newline="", encoding="utf-8") as source:
        reader = csv.DictReader(source)
        if reader.fieldnames != INPUT_FIELDS:
            raise ValueError(
                f"Expected columns {INPUT_FIELDS}, found {reader.fieldnames}"
            )
        return list(reader)


def validate_record(
    row: dict[str, str],
    source_row: int, #current row no.
    accepted_ids: set[str], #already been validated, after run function and run through conditions
) -> tuple[dict[str, str] | None, list[str]]:
    """Return a cleaned record or its ordered rejection reasons."""
    rejection_reasons:list[str] = []

    record_id = row["record_id"].strip()
    if record_id == "":
        rejection_reasons.append("missing record_id")
    elif not record_id.startswith("ST") or len(record_id) != 5 or not record_id[-3:].isdigit():
        rejection_reasons.append("invalid record_id")
    elif record_id in accepted_ids:
        rejection_reasons.append("duplicate record_id")


    location= 
    RECORDS id  row (record_id) dictionary str str, in row directory
       
    
    raise NotImplementedError("Complete the record validation")






** after all validations then put them all in accepted id




def process_records(
    rows: Iterable[dict[str, str]],
) -> tuple[list[dict[str, str]], list[dict[str, str]]]:
    """Separate accepted records from rejected-row reports."""
    raise NotImplementedError("Complete the record-processing workflow")


def summarise_oaks(clean_records: Iterable[dict[str, str]]) -> list[dict[str, str]]:
    """Count accepted oak records by species."""
    raise NotImplementedError("Complete the oak summary")


def write_csv(
    path: Path,
    fieldnames: list[str],
    rows: Iterable[dict[str, str]],
) -> None:
    """Replace a CSV file with the supplied rows."""
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="", encoding="utf-8") as destination:
        writer = csv.DictWriter(destination, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)


def main() -> None:
    """Run the complete validation workflow."""
    clean_records, issues = process_records(load_records())
    oak_counts = summarise_oaks(clean_records)

    #this is the 3 csv for assessment

    write_csv(
        RESULTS_DIR / "silwood_trees_clean.csv",
        INPUT_FIELDS,
        clean_records,
    )
    write_csv(
        RESULTS_DIR / "silwood_tree_issues.csv",
        ISSUE_FIELDS,
        issues,
    )
    write_csv(
        RESULTS_DIR / "oak_species_counts.csv",
        OAK_COUNT_FIELDS,
        oak_counts,
    )


if __name__ == "__main__":
    main()
