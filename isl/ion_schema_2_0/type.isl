$ion_schema_2_0

schema_header::{
  imports: [
    { id: "isl/ion_schema_2_0/ranges.isl" },
    { id: "isl/ion_schema_2_0/util.isl", type: built_in_type_name },
    { id: "isl/ion_schema_2_0/constraints.isl" },
  ]
}

type::{
  name: inline_import,
  fields: closed::{
    id: { type: text, annotations: closed::[], occurs: required },
    type: { type: text, annotations: closed::[], occurs: required }
  }
}

type::{
  // Building block for type definitions
  name: constraint_set,
  fields: {
    all_of:              { occurs: range::[0, max], type: all_of_constraint },
    annotations:         { occurs: range::[0, max], type: annotations_constraint },
    any_of:              { occurs: range::[0, max], type: any_of_constraint },
    byte_length:         { occurs: range::[0, max], type: byte_length_constraint },
    codepoint_length:    { occurs: range::[0, max], type: codepoint_length_constraint },
    container_length:    { occurs: range::[0, max], type: container_length_constraint },
    contains:            { occurs: range::[0, max], type: contains_constraint },
    element:             { occurs: range::[0, max], type: element_constraint },
    exponent:            { occurs: range::[0, max], type: exponent_constraint },
    field_names:         { occurs: range::[0, max], type: field_names_constraint },
    fields:              { occurs: range::[0, max], type: fields_constraint },
    ieee754_float:       { occurs: range::[0, max], type: ieee754_float_constraint },
    not:                 { occurs: range::[0, max], type: not_constraint },
    one_of:              { occurs: range::[0, max], type: one_of_constraint },
    ordered_elements:    { occurs: range::[0, max], type: ordered_elements_constraint },
    precision:           { occurs: range::[0, max], type: precision_constraint },
    regex:               { occurs: range::[0, max], type: regex_constraint },
    timestamp_offset:    { occurs: range::[0, max], type: timestamp_offset_constraint },
    timestamp_precision: { occurs: range::[0, max], type: timestamp_precision_constraint },
    type:                { occurs: range::[0, max], type: type_constraint },
    utf8_byte_length:    { occurs: range::[0, max], type: utf8_byte_length_constraint },
    valid_values:        { occurs: range::[0, max], type: valid_values_constraint },
    // Keywords that can never be used with any type definition
    as: nothing,
    id: nothing,
    schema_header: nothing,
    schema_footer: nothing,
    // Derivative types MUST place their own restrictions on these keywords
    name: $any,
    occurs: $any,
  }
}

type::{
  name: named_type_definition,
  type: constraint_set,
  annotations: { valid_values:[ [type] ]},
  fields: {
    name: {
      occurs: required,
      type: symbol,
      annotations: closed::[],
      not: built_in_type_name,
    },
    // Keywords that cannot be used specifically with a named type definition
    occurs: nothing,
  }
}

type::{
  name: inline_type_definition,
  type: constraint_set,
  fields: {
    // Keywords that cannot be used specifically with an inline type definition
    name: nothing,
    occurs: nothing,
  }
}

type::{
  name: type_reference,
  any_of: [
    symbol,
    inline_import,
    inline_type_definition,
  ]
}

type::{
  name: nullable_type_reference,
  annotations: closed::[$null_or],
  any_of: [
    symbol,
    inline_import,
    inline_type_definition,
  ]
}

type::{
  name: variably_occurring_type_reference,
  any_of: [
    nullable_type_reference,
    variably_occurring_type_definition,
  ]
}

type::{
  name: variably_occurring_type_definition,
  type: constraint_set,
  annotations: closed::[],
  fields: {
    occurs: occurs_value,
    // Keywords that cannot be used specifically with a variably-occuring type definition
    name: nothing,
  }
}

type::{
  name: occurs_value,
  one_of: [
    positive_int,
    non_negative_int_range,
    { valid_values: [optional, required], annotations: closed::[] },
  ]
}

schema_footer::{}
