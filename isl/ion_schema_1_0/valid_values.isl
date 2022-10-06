schema_header::{
}

type::{
  name: range_boundary_number,
  type: number,
  annotations: [exclusive],
}

type::{
  name: range_number,
  type: list,
  annotations: required::[range],
  ordered_elements: [
    { one_of: [ range_boundary_number, { valid_values: [min] } ] },
    { one_of: [ range_boundary_number, { valid_values: [max] } ] },
  ],
  not: { contains: [min, max] },
  container_length: 2,
}

type::{
  name: range_boundary_timestamp,
  type: timestamp,
  not: { timestamp_offset: ["-00:00"] },
  annotations: [exclusive],
}

type::{
  name: range_timestamp,
  type: list,
  annotations: required::[range],
  ordered_elements: [
    { one_of: [ range_boundary_timestamp, { valid_values: [min] } ] },
    { one_of: [ range_boundary_timestamp, { valid_values: [max] } ] },
  ],
  not: { contains: [min, max] },
  container_length: 2,
}

type::{
  name: valid_values,
  type: list,
  one_of: [
    {
      type: list,
      annotations: closed::[],
      element: {
        type: $any,
        one_of: [
          { type: $any, annotations: closed::[] },
          range_number,
          range_timestamp,
        ]
      }
    },
    range_number,
    range_timestamp,
  ],
}

schema_footer::{
}
