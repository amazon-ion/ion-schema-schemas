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
    { type: $non_type, occurs: range::[0, max] },
    { type: type, occurs: range::[0, max] },
    { type: $non_type, occurs: range::[0, max] },
    { type: schema_footer, occurs: optional },
  ],
}

type::{
  name: $non_type,
  type: $any,
  not: {
    annotations: required::[type],
  },
}

schema_footer::{
}

