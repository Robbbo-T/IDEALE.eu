# WorkPackages

This directory contains executable work packages that reference S1000D Data Modules.

## Purpose

Work packages are non-S1000D objects that provide practical, executable task instructions for maintenance personnel. They bridge the gap between structured S1000D content and shop-floor execution.

## Contents

- **task-cards/** - Individual maintenance task cards
- **checklists/** - Inspection and verification checklists
- **schedules/** - Maintenance interval schedules
- **mapping.json** - Machine-readable mapping of work packages to Data Module Codes (DMCs)

## Mapping Structure

The `mapping.json` file links work packages to their corresponding Data Modules:

```json
{
  "wpId": "WP-AMM-XX-YY-001",
  "dmcRefs": ["DMC-AMP360-XX-YY-00-00A-040A-A_en-US_010-00"],
  "actRef": "DMC-AMP360-AAA-00-00-00-00A-00AA-A_en-US_001-00",
  "effectivity": "MSN[0001..0048]; Engine=CFM56-7B"
}
```

## Key Fields

- **wpId** - Unique work package identifier
- **dmcRefs** - List of Data Module Codes referenced by this work package
- **actRef** - Applicability Cross-reference Table DMC
- **effectivity** - Product applicability (MSN ranges, configuration)

## Integration

Work packages are used by:
- Maintenance planning systems (MRP, ERP)
- Electronic logbook systems
- Maintenance execution tracking
- Man-hour estimation and scheduling

They provide a practical interface to S1000D content while maintaining full traceability through DMC references.

## Related Documentation

- [CSDB Data Modules](../CSDB/DataModules/)
- [CAS README](../README.md)

