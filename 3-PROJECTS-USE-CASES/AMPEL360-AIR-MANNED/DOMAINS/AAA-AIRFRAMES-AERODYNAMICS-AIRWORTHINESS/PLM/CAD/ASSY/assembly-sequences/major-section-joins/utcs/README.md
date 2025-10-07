# UTCS Records — Major Section Joins
- YAML naming: `ASM-AAA-{ZONE}-JOIN-{IDX}.yaml`
- Bridge: `QS→FWD→UE→FE→CB→QB`; primary_path: `FE→CB→UE`
- Reference DMU `0012` in `evidence.links` to close the loop.

---

## Bridge Pattern Components

The "bridge" describes the sequence of major structural components joined in the assembly. The abbreviations are:

- **QS**: Quarter Section
- **FWD**: Forward Section
- **UE**: Upper Element
- **FE**: Frame Element
- **CB**: Center Beam
- **QB**: Quarter Beam

The path `QS→FWD→UE→FE→CB→QB` indicates the order in which these components are joined. The `primary_path` (e.g., `FE→CB→UE`) highlights the main structural load path for this join.

## YAML Schema Requirements

Each UTCS record is a YAML file named as `ASM-AAA-{ZONE}-JOIN-{IDX}.yaml`. The schema typically includes:

```yaml
id: ASM-AAA-FWD-JOIN-01
description: "Join between Forward Section and Center Beam"
bridge:
  sequence: [QS, FWD, UE, FE, CB, QB]
  primary_path: [FE, CB, UE]
evidence:
  links:
    - dmu: "0012"
      description: "Digital Mock-Up for Forward Join"
      type: "DMU"
  documents:
    - ref: "DWG-1234"
      type: "drawing"
zone: "FWD"
index: 1
