#Test validate_record functions:
from clean_silwood_trees import validate_record

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

inside_test = valid_row_test.copy()
inside_test["angle_degrees"] = "89"
record, reasons = validate_record(inside_test, 2, set())
assert reasons == []

#Testing record_id

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

#Testing location

missing_location_test = valid_row_test.copy()
missing_location_test["location"] = ""
record, reasons = validate_record(missing_location_test, 2, set())
assert reasons == ["missing location"]

invalid_location_test = valid_row_test.copy()
invalid_location_test["location"] = "Home"
record, reasons = validate_record(invalid_location_test, 2, set())
assert reasons == ["invalid location"]

#Testing genera

missing_genus_test = valid_row_test.copy()
missing_genus_test["genus"] = ""
record, reasons = validate_record(missing_genus_test, 2, set())
assert reasons == ["missing genus"]

invalid_genus_test = valid_row_test.copy()
invalid_genus_test["genus"] = "Homo"
record, reasons = validate_record(invalid_genus_test, 2, set())
assert reasons == ["invalid genus"]

#Testing species

missing_species_test = valid_row_test.copy()
missing_species_test["species"] = ""
record, reasons = validate_record(missing_species_test, 2, set())
assert reasons == ["invalid species"]

#Testing angles

invalid_row_test = valid_row_test.copy()
invalid_row_test["angle_degrees"] = "abc"
record, reasons = validate_record(invalid_row_test, 2, set())
assert reasons == ["invalid angle_degrees"]

boundary_test = valid_row_test.copy()
boundary_test["angle_degrees"] = "90"
record, reasons = validate_record(boundary_test, 2, set())
assert reasons == ["angle_degrees out of range"]

nan_test = valid_row_test.copy()
nan_test["angle_degrees"] = "nan"
record, reasons = validate_record(nan_test, 2, set())
assert reasons == ["invalid angle_degrees"]





print("All tests passed")