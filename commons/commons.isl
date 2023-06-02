$ion_schema_2_0

// Arbitrary-length non-negative integer.
type::{
  name: uint,
  type: int,
  valid_values: range::[0, max],
}

// Equivalent to e.g. u8 (Rust), UByte (Kotlin), byte (C#).
type::{
  name: uint8,
  type: int,
  valid_values: range::[0, 255],
}

// Equivalent to e.g. u16 (Rust), UShort (Kotlin), ushort (C#).
type::{
  name: uint16,
  type: int,
  valid_values: range::[0, 65535],
}

// Equivalent to e.g. u32 (Rust), UInt (Kotlin), uint (C#).
type::{
  name: uint32,
  type: int,
  valid_values: range::[0, 4294967295],
}

// Equivalent to e.g. u64 (Rust), ULong (Kotlin), ulong (C#).
type::{
  name: uint64,
  type: int,
  valid_values: range::[0, 18446744073709551615],
}

// Equivalent to e.g. u128 (Rust).
type::{
  name: uint128,
  type: int,
  valid_values: range::[0, 340282366920938463463374607431768211455],
}


// Equivalent to e.g. i8 (Rust), Byte (Kotlin), byte (Java), sbyte (C#).
type::{
  name: int8,
  type: int,
  valid_values: range::[-128, 127],
}

// Equivalent to e.g. i16 (Rust), Short (Kotlin), short (Java), short (C#).
type::{
  name: int16,
  type: int,
  valid_values: range::[-32768, 32767],
}

// Equivalent to e.g. i32 (Rust), Int (Kotlin), int (Java), int (C#).
type::{
  name: int32,
  type: int,
  valid_values: range::[-2147483648, 2147483647],
}

// Equivalent to e.g. i64 (Rust), Long (Kotlin), long (Java), long (C#).
type::{
  name: int64,
  type: int,
  valid_values: range::[-9223372036854775808, 9223372036854775807],
}

// Equivalent to e.g. i128 (Rust).
type::{
  name: int128,
  type: int,
  valid_values: range::[
    -170141183460469231731687303715884105728,
    170141183460469231731687303715884105727
  ],
}

// Equivalent to e.g. half::f16 (Rust).
type::{
  name: float16,
  type: float,
  ieee754_float: binary16,
}

// Equivalent to e.g. f32 (Rust), float (Java).
// Contrast with Ion Schema `float` which is equivalent to e.g. f64 (Rust), double (Java).
type::{
  name: float32,
  type: float,
  ieee754_float: binary32,
}

// Redundant alias for float (Ion Schema)—present for completeness.
// Also equivalent to e.g. f64 (Rust), double (Java).
type::{
  name: float64,
  type: float,
  ieee754_float: binary64,
}

// Closest possible equivalent to e.g. SQL Date, LocalDate (JDK 8+), DateOnly (.NET 6+)
type::{
  name: date,
  type: timestamp,
  timestamp_precision: day,
}

type::{
  name: utc_seconds_timestamp,
  type: timestamp,
  timestamp_precision: second,
  timestamp_offset: ["+00:00"],
}

type::{
  name: utc_millis_timestamp,
  type: timestamp,
  timestamp_precision: millisecond,
  timestamp_offset: ["+00:00"],
}

type::{
  name: utc_micros_timestamp,
  type: timestamp,
  timestamp_precision: millisecond,
  timestamp_offset: ["+00:00"],
}

// Closest possible equivalent to e.g. Instant (JDK 8+)
type::{
  name: utc_nanos_timestamp,
  type: timestamp,
  timestamp_precision: nanosecond,
  timestamp_offset: ["+00:00"],
}
