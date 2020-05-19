schema_header::{
  imports: [
    { id: "isl/type.isl" },
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
  ordered_elements: [
    { type: schema_header, occurs: optional },
    { type: type_or_$non_isl, occurs: range::[0, max] },
    { type: schema_footer, occurs: optional },
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

