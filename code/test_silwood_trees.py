#Test validate_record functions:
from clean_silwood_trees import validate_record, process_records, summarise_oaks

#Valid row: test

valid_row_test = {"record_id": "ST001", 
                  "location": "Manor House", 
                  "genus": "Quercus",
                  "species": "robur", 
                  "distance_m": "15", 
                  "angle_degrees": "53"
                    }

record, reasons = validate_record(valid_row_test, 2, set())
assert reasons == []
print("validate record passed")

#Record_id test

missing_id_test = valid_row_test.copy()
missing_id_test["record_id"] = ""
record, reasons = validate_record(missing_id_test, 2, set())
assert reasons == ["missing record_id"]

lowercase_id_test = valid_row_test.copy()
lowercase_id_test["record_id"] = "st001"
record, reasons = validate_record(lowercase_id_test, 2, set())
assert reasons == ["invalid record_id"]

record, reasons = validate_record(valid_row_test, 2, {"ST001"})
assert reasons == ["duplicate record_id"]

#Location test

missing_location_test = valid_row_test.copy()
missing_location_test["location"] = ""
record, reasons = validate_record(missing_location_test, 2, set())
assert reasons == ["missing location"]

invalid_location_test = valid_row_test.copy()
invalid_location_test["location"] = "Home"
record, reasons = validate_record(invalid_location_test, 2, set())
assert reasons == ["invalid location"]

#Genera test

missing_genus_test = valid_row_test.copy()
missing_genus_test["genus"] = ""
record, reasons = validate_record(missing_genus_test, 2, set())
assert reasons == ["missing genus"]

invalid_genus_test = valid_row_test.copy()
invalid_genus_test["genus"] = "Homo"
record, reasons = validate_record(invalid_genus_test, 2, set())
assert reasons == ["invalid genus"]

#Species test

missing_species_test = valid_row_test.copy()
missing_species_test["species"] = ""
record, reasons = validate_record(missing_species_test, 2, set())
assert reasons == ["missing species"]

invalid_species_test = valid_row_test.copy()
invalid_species_test["species"] = "sapiens"
record, reasons = validate_record(invalid_species_test, 2, set())
assert reasons == ["invalid species"]

#Genus species pair test

invalid_pair_test = valid_row_test.copy()
invalid_pair_test["genus"], invalid_pair_test["species"] = "Quercus", "pendula"
record, reasons = validate_record(invalid_pair_test, 2, set())
assert reasons == ["invalid genus/species combination"]

#Distance test

missing_distance_test = valid_row_test.copy()
missing_distance_test["distance_m"] = ""
record, reasons = validate_record(missing_distance_test, 2, set())
assert reasons == ["missing distance_m"]

invalid_distance_test = valid_row_test.copy()
invalid_distance_test["distance_m"] = "far"
record, reasons = validate_record(invalid_distance_test, 2, set())
assert reasons == ["invalid distance_m"]

boundary_distance_test = valid_row_test.copy()
boundary_distance_test["distance_m"] = "0"
record, reasons = validate_record(boundary_distance_test, 2, set())
assert reasons == ["distance_m out of range"]

#Angle test

invalid_row_test = valid_row_test.copy()
invalid_row_test["angle_degrees"] = "abc"
record, reasons = validate_record(invalid_row_test, 2, set())
assert reasons == ["invalid angle_degrees"]

boundary_angle_test = valid_row_test.copy()
boundary_angle_test["angle_degrees"] = "90"
record, reasons = validate_record(boundary_angle_test, 2, set())
assert reasons == ["angle_degrees out of range"]

nan_test = valid_row_test.copy()
nan_test["angle_degrees"] = "nan"
record, reasons = validate_record(nan_test, 2, set())
assert reasons == ["invalid angle_degrees"]

inside_test = valid_row_test.copy()
inside_test["angle_degrees"] = "89"
record, reasons = validate_record(inside_test, 2, set())
assert reasons == []

print("All tests passed")


#Test process_record functions:


process_records_test = [{"record_id": "ST001", 
                         "location": "manor house", 
                         "genus": "Quercus",
                         "species": "robur", 
                         "distance_m": "15", 
                         "angle_degrees": "53"},
                         {"record_id": "st001",
                          "location": "Manor Houses",
                          "genus": "Quercus",
                          "species": "robur",
                          "distance_m": "50",
                          "angle_degrees": "10"}, 
                          {"record_id": "st001",
                           "location": "silwood bottom",
                           "genus": "Quercus",
                           "species": "petraea",
                           "distance_m": "100",
                           "angle_degrees": "89"}]

clean_records, issues = process_records(process_records_test)
print("Clean records:", clean_records)
print("Issues:", issues)
    
#Test summarise_oaks:

summarise_oaks_test = [{"record_id": "ST001", 
                         "location": "manor house", 
                         "genus": "Quercus",
                         "species": "robur", 
                         "distance_m": "15", 
                         "angle_degrees": "53"},
                         {"record_id": "ST002",
                          "location": "Manor House",
                          "genus": "Quercus",
                          "species": "robur",
                          "distance_m": "50",
                          "angle_degrees": "10"}, 
                          {"record_id": "ST003",
                           "location": "silwood bottom",
                           "genus": "Quercus",
                           "species": "petraea",
                           "distance_m": "50",
                           "angle_degrees": "32"}]

oak_counts = summarise_oaks(summarise_oaks_test)
print(oak_counts)
assert oak_counts == [
    {"species": "petraea", "count": 1},
    {"species": "robur", "count": 2}
]

