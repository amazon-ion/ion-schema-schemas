type::{
  name: json,
  type: $any,
  one_of: [
    json_array,
    json_boolean,
    json_null,
    json_number,
    json_object,
    json_string,
  ],
}

type::{
  name: json_array,
  type: list,
  annotations: closed::[],
  element: json,
}

type::{
  name: json_boolean,
  type: bool,
  annotations: closed::[],
}

type::{
  name: json_null,
  type: $null,
  annotations: closed::[],
}

type::{
  name: json_number,
  one_of: [float, int],
  not: { valid_values: [nan, +inf, -inf] },
  annotations: closed::[],
}

type::{
  name: json_object,
  type: struct,
  annotations: closed::[],
  element: json,
}

type::{
  name: json_string,
  type: string,
  annotations: closed::[],
}
