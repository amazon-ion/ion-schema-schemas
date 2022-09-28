schema_header::{
  imports: [
    { id: "isl/ion_schema_1_0/annotations.isl",         type: annotations },
    { id: "isl/ion_schema_1_0/byte_length.isl",         type: byte_length },
    { id: "isl/ion_schema_1_0/codepoint_length.isl",    type: codepoint_length },
    { id: "isl/ion_schema_1_0/container_length.isl",    type: container_length },
    { id: "isl/ion_schema_1_0/contains.isl",            type: contains },
    { id: "isl/ion_schema_1_0/content.isl",             type: content },
    { id: "isl/ion_schema_1_0/occurs.isl",              type: occurs },
    { id: "isl/ion_schema_1_0/precision.isl",           type: precision },
    { id: "isl/ion_schema_1_0/regex.isl",               type: regex },
    { id: "isl/ion_schema_1_0/scale.isl",               type: scale },
    { id: "isl/ion_schema_1_0/timestamp_offset.isl",    type: timestamp_offset },
    { id: "isl/ion_schema_1_0/timestamp_precision.isl", type: timestamp_precision },
    { id: "isl/ion_schema_1_0/valid_values.isl",        type: valid_values },
  ],
}

type::{
  name: type_name,
  type: symbol,
}

type::{
  name: type_inline,
  type: struct,
  fields: {
    all_of:              list_of_type_references,
    annotations:         annotations,
    any_of:              list_of_type_references,
    byte_length:         byte_length,
    codepoint_length:    codepoint_length,
    container_length:    container_length,
    contains:            contains,
    content:             content,
    element:             type_reference,
    fields:              { type: struct, element: type_reference },
    not:                 type_reference,
    occurs:              occurs,
    one_of:              list_of_type_references,
    ordered_elements:    list_of_type_references,
    precision:           precision,
    regex:               regex,
    scale:               scale,
    timestamp_offset:    timestamp_offset,
    timestamp_precision: timestamp_precision,
    type:                type_reference,
    valid_values:        valid_values,
  },
}

type::{
  name: type,
  type: type_inline,
  annotations: required::[type],
  fields: {
    name: { type: symbol, occurs: required },
  },
}

type::{
  name: type_import_inline,
  type: struct,
  fields: {
    id: { type: string, occurs: required },
    type: { type: symbol, occurs: required },
  },
  annotations: [nullable],
}

type::{
  name: type_reference,
  any_of: [
    type_name,
    type_inline,
    type_import_inline,
  ],
  annotations: [nullable],
}

type::{
  name: list_of_type_references,
  type: list,
  element: type_reference,
}

schema_footer::{
}
