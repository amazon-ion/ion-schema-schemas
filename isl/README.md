## Ion Schema Language (ISL)

Sometimes referred to as "ISL for ISL," the schema defined by the files in this folder can be used to validate other schemas expressed in ISL.
Note that this schema cannot identify all ISL violations.
For example, validating that a regex constraint is specified with a valid regex string is beyond the scope of this schema.

The organization of constituent parts for each ISL schema version may vary.
However, for every Ion Schema version, there will be a schema id in the form `isl/<ion-schema-version>.isl`.
This schema file will expose the definitions for certain core Ion Schema types—`schema`, `schema_header`, `schema_footer`, `named_type_definition`, and `inline_type_definition`.

For example, to determine whether something is a valid Ion Schema 2.0 document, you would load the `isl/ion_schema_2_0.isl` schema and validate using the `schema` type.

In addition, `ion-schema-schemas` provides multi-version ISL types.
The schema `isl/ion_schema.isl` provides core Ion Schema types that are a union of all versions of Ion Schema.

A word of caution—you must assume that any multi-version ISL types will change at some point in the future.
Any changes to multi-version types will strictly increase the permissiveness of the type.
However, that does not guarantee that the change will be backwards compatible _for your use case_.

For backwards compatibility for consumers who were using `ion-schema-schemas` by way of `ion-schema-kotlin` prior to the introduction of Ion Schema 2.0, the Ion Schema 1.0 schema definition also appears in the `isl` folder.
No libraries should take a new dependency on these schema files—they will be removed at some point in the future.
