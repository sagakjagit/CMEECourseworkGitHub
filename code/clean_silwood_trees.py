#!/usr/bin/env python3
"""Validate and clean the synthetic Silwood tree survey."""

from __future__ import annotations

import csv
import math
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

#ADD CONSTANTS HERE TOP OF CODE
CANONICAL_LOCATIONS = ["Silwood Bottom", "Nash's Field", "Manor House", "Reactor Wood"]
CANONICAL_GENERA = ["Quercus", "Acer", "Betula", "Fagus", "Fraxinus"]
CANONICAL_SPECIES = ["robur", "petraea", "pseudoplatanus", "pendula", "sylvatica", "excelsior"]
PERMITTED_PAIRS = {
    ("Quercus", "robur"),
    ("Quercus", "petraea"),
    ("Acer", "pseudoplatanus"),
    ("Betula", "pendula"),
    ("Fagus", "sylvatica"),
    ("Fraxinus", "excelsior"),
}

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

    location = row["location"].strip()
    if location == "":
        rejection_reasons.append("missing location")
    elif location.lower() not in [name.lower() for name in CANONICAL_LOCATIONS]:
        rejection_reasons.append("invalid location")
    else:
        for name in CANONICAL_LOCATIONS:
            if name.lower() == location.lower():
                location = name
            
    genus = row["genus"].strip()
    if genus == "":
        rejection_reasons.append("missing genus")
    elif genus.lower() not in [name.lower() for name in CANONICAL_GENERA]:
        rejection_reasons.append("invalid genus")
    else:
        for name in CANONICAL_GENERA:
            if name.lower() == genus.lower():
                genus = name

    species = row["species"].strip()
    if species == "":
        rejection_reasons.append("missing species")
    elif species.lower() not in [name.lower() for name in CANONICAL_SPECIES]:
        rejection_reasons.append("invalid species")
    else:
        for name in CANONICAL_SPECIES:
            if name.lower() == species.lower():
                species = name 

    if genus in CANONICAL_GENERA and species in CANONICAL_SPECIES:
        if (genus, species) not in PERMITTED_PAIRS:
            rejection_reasons.append("invalid genus/species combination")

    distance_m = row["distance_m"].strip()
    if distance_m == "":
        rejection_reasons.append("missing distance_m")
    else:
        try:
            distance_value = float(distance_m)
        except:
            rejection_reasons.append("invalid distance_m") 
        else:
            if not math.isfinite(distance_value):
                rejection_reasons.append("invalid distance_m")
            elif not 0 < distance_value <= 100:
                rejection_reasons.append("distance_m out of range")
    
    angle_degrees = row["angle_degrees"].strip()
    if angle_degrees == "":
        rejection_reasons.append("missing angle_degrees")
    else:
        try:
            angle_value = float(angle_degrees)
        except ValueError:
            rejection_reasons.append("invalid angle_degrees")
        else:
            if not math.isfinite(angle_value):
                rejection_reasons.append("invalid angle_degrees")
            elif not 0 < angle_value < 90:
                rejection_reasons.append("angle_degrees out of range")

    if rejection_reasons:
        return None, rejection_reasons

    clean_values = {
        "record_id": record_id,
        "location": location,
        "genus": genus,
        "species": species,
        "distance_m": distance_m,
        "angle_degrees": angle_degrees,
    }
    return clean_values, rejection_reasons

def process_records(
    rows: Iterable[dict[str, str]],
) -> tuple[list[dict[str, str]], list[dict[str, str]]]:
    """Separate accepted records from rejected-row reports."""

    clean_records = [] #good rows in clean_values
    issues = [] #bad rows in rejection_reasons
    accepted_ids = set() #record_id for clean_records
    source_row = 1

    for row in rows:
        source_row = source_row + 1 #start after header





    else:
        clean_records.append(clean_values) #add clean values to new clean_records
        accepted_ids.append(clean_values["record_id"]) #record_id for clean_values 





#create issues

#separate the rows





   
    
    
    #raise NotImplementedError("Complete the record-processing workflow")

#acceoted id record_id of clean values









def summarise_oaks(clean_records: Iterable[dict[str, str]]) -> list[dict[str, str]]:
    """Count accepted oak records by species."""
    #raise NotImplementedError("Complete the oak summary")







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
