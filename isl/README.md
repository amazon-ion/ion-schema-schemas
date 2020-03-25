## Ion Schema Language (ISL)

Sometimes referred to as "ISL for ISL," the schema defined by the files
in this folder can be used to validate other schemas expressed in ISL.
Note that this schema cannot identify all ISL violations (for example,
validating that a regex constraint is specified with a valid regex string
is beyond the scope of this schema).

All schema ids specified here are of the form `isl/<filename>.isl`.
To determine whether a document conforms, validate it using the
`schema` type found in `isl/schema.isl`.

