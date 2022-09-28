schema_header::{
  imports: [
    { id: "isl/ion_schema_1_0/non_negative_int.isl" },
  ],
}

type::{
  name: occurs,
  one_of: [
    non_negative_int,
    range_non_negative_int,
    { valid_values: [optional, required] },
  ],
}

schema_footer::{
}
