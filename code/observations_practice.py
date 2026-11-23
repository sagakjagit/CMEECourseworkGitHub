import csv

def load_observations(path):
    with open(path, newline="", encoding="utf-8") as stream:
        return list(csv.DictReader(stream))

def parse_count(count_text):
    if count_text == "":
        return None 

    # Count text must be given as a string ------------------------------
    if type(count_text) == int:
        raise ValueError("Count text must be string")


    # Convert to int, failing if it is "many" ---------------------------
    count_int = int(count_text)
    if count_int < 0:
        raise ValueError("Count cannot be negative")
    return count_int

def summarise_site(rows, site):
    known_total = 0
    missing_total = 0
    has_known_counts = False
    seen = set()

    if rows is None:
        raise ValueError("Dictionary cannot be none")

    if site == "" or type(site) == int:
        raise ValueError("Site must be provided")

    for row in rows:
        if type(row) != dict:
            raise ValueError("Row is not dictionary")

        for key in row.keys():
            if key not in ["site", "date", "count"]:
                raise ValueError("Extra key given")

        try:
            row_site = row["site"]
            row_date = row["date"]
            row_count = row["count"]
        except KeyError:
            raise ValueError("Key is not given")

        if type(row_site) != str or row_site == "":
            raise ValueError("Site is invalid")

        if type(row_date) != str or row_date == "":
            raise ValueError("Date is invalid")

        parsed_row_count = parse_count(row_count)
        seen_record = (row_site, row_date, row_count)

        if row_site == site and seen_record not in seen:
            seen.add(seen_record)

            # Unknown counts are missing ---------------------------------
            if parsed_row_count is None:
                missing_total += 1
            else:
                has_known_counts = True
                known_total += parsed_row_count

    if not has_known_counts:
        return (None, missing_total)
    return (known_total, missing_total)


if __name__ == "__main__":
    rows = load_observations("data/bootcamp_observations.csv")
    print(rows[0])
    print(rows[2])