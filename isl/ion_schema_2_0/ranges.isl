$ion_schema_2_0

// Element types for ranges
// Not defined here are `timestamp`, `int`, and `number` since they are built-in types

type::{
  name: positive_int,
  type: int,
  annotations: closed::[],
  valid_values: range::[1, max],
}

type::{
  name: non_negative_int,
  type: int,
  annotations: closed::[],
  valid_values: range::[0, max],
}

type::{
  name: timestamp_precision,
  valid_values: [
    year,
    month,
    day,
    minute,
    second,
    millisecond,
    microsecond,
    nanosecond,
  ],
}

type::{
  name: min_or_max,
  valid_values: [min, max],
}

// Ranges

type::{
  // `range_base` defines rules that are true for all ranges
  name: range_base,
  type: list,
  annotations: closed::required::[range],
  ordered_elements:[
    {
      one_of: [
        // Min cannot be exclusive
        { valid_values: [min], annotations: closed::[] },
        { not: min_or_max, annotations: closed::[exclusive] }
      ]
    },
    {
      one_of: [
        // Max cannot be exclusive
        { valid_values: [max], annotations: closed::[] },
        { not: min_or_max, annotations: closed::[exclusive] }
      ]
    },
  ],
  // Range cannot contain min AND max
  not: { contains: [min, max] }
}

type::{
  name: int_range,
  type: range_base,
  element: { one_of: [ int, min_or_max ] },
}

type::{
  name: non_negative_int_range,
  type: int_range,
  element: { valid_values: [ min, max, range::[0, max] ] },
}

type::{
  name: positive_int_range,
  type: int_range,
  element: { valid_values: [ min, max, range::[1, max] ] },
}

type::{
  name: number_range,
  type: range_base,
  element: {
    one_of: [ number, min_or_max ],
    not: { valid_values: [nan, +inf, -inf] }
  },
}

type::{
  name: timestamp_range,
  type: range_base,
  element: { one_of: [ timestamp, min_or_max ] },
}

type::{
  name: timestamp_precision_range,
  type: range_base,
  element: { one_of: [ timestamp_precision, min_or_max ] },
  // Because timestamp_precision has a finite number of values, we can explicitly list
  // all elements (as optional) to enforce a specific order in which they can appear.
  ordered_elements: [
    { occurs: optional, valid_values: [min] },
    { occurs: optional, valid_values: [year] },
    { occurs: optional, valid_values: [month] },
    { occurs: optional, valid_values: [day] },
    { occurs: optional, valid_values: [minute] },
    { occurs: optional, valid_values: [second] },
    { occurs: optional, valid_values: [millisecond] },
    { occurs: optional, valid_values: [microsecond] },
    { occurs: optional, valid_values: [nanosecond] },
    { occurs: optional, valid_values: [max] },
  ]
}

// Unions of the range with its respective element type.
// Many constraints allow e.g. an int or an int range.

type::{
  name: positive_int_value_or_range,
  one_of:[
    positive_int,
    positive_int_range,
  ]
}

type::{
  name: non_negative_int_value_or_range,
  one_of:[
    non_negative_int,
    non_negative_int_range,
  ]
}

type::{
  name: int_value_or_range,
  one_of:[
    { type: int, annotations: closed::[] },
    int_range,
  ]
}

type::{
  name: timestamp_precision_value_or_range,
  one_of:[
    { type: timestamp_precision, annotations: closed::[] },
    timestamp_precision_range,
  ]
}
