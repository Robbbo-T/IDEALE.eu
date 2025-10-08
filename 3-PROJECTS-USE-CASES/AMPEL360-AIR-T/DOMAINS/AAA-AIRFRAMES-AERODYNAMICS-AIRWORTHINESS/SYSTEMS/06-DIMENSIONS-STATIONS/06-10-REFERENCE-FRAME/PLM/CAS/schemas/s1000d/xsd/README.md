# S1000D XSD Schemas

This directory should contain the official S1000D Issue 6.0 XML Schema Definition files.

## Required Schema Files

Download from [S1000D.org](http://www.s1000d.org/) and place here:

### Core Schemas
- `dmodule.xsd` — Data Module root schema
- `pm.xsd` — Publication Module root schema
- `commonRepository.xsd` — Common Information Repository
- `crew.xsd` — Crew procedures
- `appliccrossreftable.xsd` — Applicability cross-reference
- `infoEntityResolver.xsd` — Information entity resolution

### Type Definition Schemas
- `applicability.xsd` — Applicability structures
- `commonInfo.xsd` — Common information types
- `description.xsd` — Descriptive content
- `fault.xsd` — Fault isolation structures
- `learning.xsd` — Learning content
- `maintenance.xsd` — Maintenance procedures
- `process.xsd` — Process content
- `procedure.xsd` — Procedural steps

### Supporting Schemas
- `identStatusTypes.xsd` — Identification and status types
- `multimedia.xsd` — Multimedia objects
- `tables.xsd` — Table structures
- `techpub.xsd` — Technical publication types

## Usage

Validate Data Modules against schemas:

```bash
xmllint --noout --schema schemas/s1000d/xsd/dmodule.xsd \
  CSDB/DataModules/MAINTENANCE/06-10/*.xml
```

Validate Publication Modules:

```bash
xmllint --noout --schema schemas/s1000d/xsd/pm.xsd \
  CSDB/PublicationModules/*.xml
```

## Version

All schemas must be from **S1000D Issue 6.0** release.

## Related

- [S1000D Specification](http://www.s1000d.org/)
- [../schematron/](../schematron/) — Business rule validation
- [../brex-tests/](../brex-tests/) — Custom validation rules
