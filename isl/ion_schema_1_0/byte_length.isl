schema_header::{
  imports: [
    { id: "isl/ion_schema_1_0/non_negative_int.isl" },
  ],
}

type::{
  name: byte_length,
  one_of: [
    non_negative_int,
    range_non_negative_int,
  ],
}

schema_footer::{
}
