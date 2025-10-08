# Inspection Evidence

This directory contains inspection reports and data used to demonstrate compliance through visual or dimensional verification.

## Purpose

Inspection evidence shows compliance through:
- **Visual inspections** — Surface condition, workmanship, conformity
- **Dimensional inspections** — CMM measurements, tooling verification
- **Non-destructive testing (NDT)** — Ultrasonic, X-ray, eddy current
- **Material verification** — Chemical composition, mechanical properties
- **Process validation** — Manufacturing process control records

## Naming Convention

```
INS-53-10-<FEATURE>-R<NN>.pdf
```

Examples:
- `INS-53-10-SKIN-THICKNESS-R01.pdf` — Skin thickness inspection
- `INS-53-10-FASTENER-INSTALLATION-R02.pdf` — Fastener installation quality
- `INS-53-10-NDT-WELDS-R01.pdf` — NDT inspection of welded joints

## Required Content

Each inspection report should include:
1. **Objective** — Requirements addressed, inspection criteria
2. **Inspected items** — Serial numbers, drawing references, UTCS anchors
3. **Inspection method** — Visual, CMM, NDT technique, equipment
4. **Accept/reject criteria** — Dimensional tolerances, surface finish, defect limits
5. **Results** — Measurements, observations, defect locations
6. **Disposition** — Accept, reject, repair, use-as-is with deviation
7. **Photographic evidence** — Annotated photos of key features
8. **Traceability** — UTCS anchors to CAD, materials, processes
9. **Approvals** — Inspector, QA, design authority

## Inspection Types

### Visual Inspection
- Surface finish and appearance
- Installation workmanship
- Foreign object debris (FOD) check
- Marking and identification

### Dimensional Inspection
- CMM measurements (First Article Inspection)
- Tooling and fixture verification
- Assembly gap and flush verification
- Profile and contour checks

### Non-Destructive Testing (NDT)
- Ultrasonic thickness measurement
- X-ray inspection of joints and fasteners
- Eddy current crack detection
- Magnetic particle inspection of ferrous parts

### Material Verification
- Material test reports (MTR)
- Chemical composition verification
- Mechanical property testing
- Certification of conformity

## First Article Inspection (FAI)

For first articles, provide comprehensive inspection:
- 100% dimensional verification per drawing
- Material certifications
- Process verification records
- NDT per manufacturing plan
- QA sign-off and UTCS anchoring

## Related

- [../../records/](../../records/) — MoC records citing inspection evidence
- [../../../../../PLM/CAD/](../../../../../PLM/CAD/) — Design drawings and tolerances
- [../../../../../PLM/CAV/](../../../../../PLM/CAV/) — Quality inspection protocols
