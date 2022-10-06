$ion_schema_2_0

schema_header::{
  imports: [
    { id: "isl/ion_schema_2_0/ranges.isl" },
    { id: "isl/ion_schema_2_0/type.isl" },
  ]
}

type::{
  name: all_of_constraint,
  type: list,
  annotations: closed::[],
  element: nullable_type_reference,
}

type::{
  name: annotations_constraint,
  one_of: [
    nullable_type_reference,
    {
      // "Simplified" syntax -- a list of valid annotations
      type: list,
      // List may be annotated with "closed" or "required" or both
      annotations: {
        container_length: range::[1,2],
        element: { valid_values: [closed, required] }
      },
      // Individual annotations symbols may not be annotated
      element: { type: symbol, annotations: closed::[] },
    }
  ]
}

type::{
  name: any_of_constraint,
  type: list,
  annotations: closed::[],
  element: nullable_type_reference,
}

type::{
  name: byte_length_constraint,
  type: non_negative_int_value_or_range,
}

type::{
  name: codepoint_length_constraint,
  type: non_negative_int_value_or_range,
}

type::{
  name: container_length_constraint,
  type: non_negative_int_value_or_range,
}

type::{
  name: contains_constraint,
  annotations: closed::[],
  type: list,
}

type::{
  name: element_constraint,
  annotations: closed::[$null_or, distinct],
  type: type_reference,
}

type::{
  name: exponent_constraint,
  type: int_value_or_range,
}

type::{
  name: field_names_constraint,
  annotations: closed::[$null_or, distinct],
  type: type_reference,
}

type::{
  name: fields_constraint,
  type: struct,
  annotations: closed::[closed],
  container_length: range::[1, max],
  field_names: distinct::symbol,
  element: variably_occurring_type_reference,
}

type::{
  name: ieee754_float_constraint,
  annotations: closed::[],
  valid_values: [binary16, binary32, binary64],
}

type::{
  name: not_constraint,
  type: nullable_type_reference,
}

type::{
  name: one_of_constraint,
  type: list,
  annotations: closed::[],
  element: nullable_type_reference,
}

type::{
  name: ordered_elements_constraint,
  type: list,
  annotations: closed::[],
  element: variably_occurring_type_reference,
}

type::{
  name: precision_constraint,
  type: positive_int_value_or_range,
}

type::{
  name: regex_constraint,
  // Not feasible to create a regex for valid regexes
  type: string,
  codepoint_length: range::[1, max],
  annotations: closed::[m, i],
}

type::{
  name: timestamp_offset_constraint,
  type: list,
  annotations: closed::[],
  container_length: range::[1, max],
  element: {
    type: string,
    annotations: closed::[],
    regex: "^[+-]([01][0-9]|2[0-3]):[0-5][0-9]$",
  },
}

type::{
  name: timestamp_precision_constraint,
  type: timestamp_precision_value_or_range,
}

type::{
  name: type_constraint,
  type: nullable_type_reference,
}

type::{
  name: utf8_byte_length_constraint,
  type: non_negative_int_value_or_range,
}

type::{
  name: valid_values_constraint,
  one_of: [
    number_range,
    timestamp_range,
    {
      // List of values and/or ranges
      type: list,
      annotations: closed::[],
      element: {
        one_of: [
          timestamp_range,
          number_range,
          { annotations: closed::[] },
        ]
      }
    },
  ]
}

schema_footer::{}

