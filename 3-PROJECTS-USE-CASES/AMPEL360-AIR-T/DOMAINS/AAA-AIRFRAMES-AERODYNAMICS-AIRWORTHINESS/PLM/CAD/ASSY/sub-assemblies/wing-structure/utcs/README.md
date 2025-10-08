# UTCS Records — Wing Structure Sub-Assemblies
- Canon bridge: `QS→FWD→UE→FE→CB→QB`
- Primary path for sub-assembly module realization: `FE→CB→UE`
- One YAML per artifact (module / BOM / ICD). Paths in `sheet.files` are relative to this folder's parent.

## Template Files

- **`utc-template.yaml`** - Generic Universal/Test Case template with fields for test_case_id, title, objective, configuration (cad_model, drawing_ref, tools), steps, acceptance_criteria, evidence, and status. Use this as a starting point for creating verification and test case definitions for wing structure assemblies.
