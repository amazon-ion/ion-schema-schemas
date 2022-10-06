$ion_schema_1_0

type::{
  name: schema,
  any_of: [
    { id: "isl/ion_schema_1_0.isl", type: schema },
    { id: "isl/ion_schema_2_0.isl", type: schema },
  ]
}

type::{
  name: schema_header,
  any_of: [
    { id: "isl/ion_schema_1_0.isl", type: schema_header },
    { id: "isl/ion_schema_2_0.isl", type: schema_header },
  ]
}

type::{
  name: named_type_definition,
  any_of: [
    { id: "isl/ion_schema_1_0.isl", type: named_type_definition },
    { id: "isl/ion_schema_2_0.isl", type: named_type_definition },
  ]
}

type::{
  name: inline_type_definition,
  any_of: [
    { id: "isl/ion_schema_1_0.isl", type: inline_type_definition },
    { id: "isl/ion_schema_2_0.isl", type: inline_type_definition },
  ]
}

type::{
  name: schema_footer,
  any_of: [
    { id: "isl/ion_schema_1_0.isl", type: schema_footer },
    { id: "isl/ion_schema_2_0.isl", type: schema_footer },
  ]
}
