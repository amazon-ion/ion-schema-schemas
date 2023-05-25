$ion_schema_2_0

schema_header::{
  imports: [
    { id: "isl/ion_schema_2_0/type.isl", type: named_type_definition },
    { id: "isl/ion_schema_2_0/util.isl", type: isl_keyword },
    { id: "isl/ion_schema_2_0/util.isl", type: maybe_isl_version_marker },
    { id: "isl/ion_schema_2_0/util.isl", type: reserved_symbol },
  ]
}

type::{
  name: schema,
  type: document,
  one_of: [
    {
      ordered_elements: [
        { type: top_level_open_content, occurs: range::[0, max] },
        isl_2_0_version_marker,
        { type: top_level_open_content, occurs: range::[0, max] },
        { type: schema_header, occurs: optional },
        { one_of: [top_level_open_content, named_type_definition], occurs: range::[0, max] },
        schema_footer,
        { type: $any, occurs: range::[0, max] },
      ]
    },
    {
      ordered_elements: [
        { type: top_level_open_content, occurs: range::[0, max] },
        isl_2_0_version_marker,
        { type: top_level_open_content, occurs: range::[0, max] },
        { type: schema_header, occurs: optional },
        { one_of: [top_level_open_content, named_type_definition], occurs: range::[0, max] },
      ]
    }
  ]
}

type::{
  name: isl_2_0_version_marker,
  valid_values: [$ion_schema_2_0],
  annotations: closed::[],
}

type::{
  name: schema_header,
  type: struct,
  annotations: { valid_values:[ [schema_header] ]},
  fields: {
    imports: {
      type: list,
      annotations: closed::[],
      element: header_import,
    },
    user_reserved_fields: {
      annotations: closed::[],
      fields: closed::{
        schema_header: user_reserved_fields_list,
        type: user_reserved_fields_list,
        schema_footer: user_reserved_fields_list,
      }
    },
  }
}

type::{
  name: user_reserved_fields_list,
  type: list,
  annotations: closed::[],
  element: distinct::{
    type: symbol,
    annotations: closed::[],
    not: isl_keyword
  }
}

type::{
  name: header_import,
  type: struct,
  annotations: closed::[],
  fields: closed::{
    id: { type: text, annotations: closed::[], occurs: required },
    type: {type: symbol, annotations: closed::[]},
    as: {type: symbol, annotations: closed::[]},
  },
  any_of: [
    // If `as` is present, then `type` is required.
    { fields: { as: nothing } },
    { fields: { type: { occurs: required } } },
  ]
}

type::{
  name: top_level_open_content,
  annotations: { element: { not: reserved_symbol } },
  not: maybe_isl_version_marker,
}

type::{
  name: schema_footer,
  type: struct,
  annotations: { valid_values:[ [schema_footer] ]},
}

schema_footer::{}
