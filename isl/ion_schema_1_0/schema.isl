schema_header::{
  imports: [
    { id: "isl/ion_schema_1_0/type.isl" },
  ],
}

type::{
  name: import,
  type: struct,
  fields: {
    id: { type: string, occurs: required },
    type: symbol,
    as: symbol,
  },
}

type::{
  name: schema_header,
  type: struct,
  annotations: required::[schema_header],
  fields: {
    imports: { type: list, element: import },
  },
}

type::{
  name: schema_footer,
  type: struct,
  annotations: required::[schema_footer],
}

type::{
  name: schema,
  type: document,
  any_of:[
    schema_with_header_and_footer,
    schema_without_header_and_footer,
  ],
}

type::{
  name: schema_without_header_and_footer,
  ordered_elements: [
    { type: $non_isl, occurs: range::[0, max] },
    { valid_values: [$ion_schema_1_0], occurs: optional },
    { type: type_or_$non_isl, occurs: range::[0, max] },
  ],
}

type::{
  name: schema_with_header_and_footer,
  ordered_elements: [
    { type: $non_isl, occurs: range::[0, max] },
    { valid_values: [$ion_schema_1_0], occurs: optional },
    { type: $non_isl, occurs: range::[0, max] },
    { type: schema_header },
    { type: type_or_$non_isl, occurs: range::[0, max] },
    { type: schema_footer },
    { type: $non_isl, occurs: range::[0, max] },
  ],
}

type::{
  name: type_or_$non_isl,
  one_of: [
    type,
    $non_isl,
  ],
}

type::{
  name: $non_isl,
  type: $any,
  not: {
    one_of: [
      { annotations: required::[schema_header] },
      { annotations: required::[type] },
      { annotations: required::[schema_footer] },
    ],
  },
}

schema_footer::{
}
