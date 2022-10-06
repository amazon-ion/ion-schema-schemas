type::{
  name: timestamp_offset,
  type: list,
  container_length: range::[1, max],
  element: {
    type: string,
    regex: "^[+|-]([01][0-9]|2[0-3]):[0-5][0-9]$",
  },
}
