# Similarity Evidence

This directory contains documentation demonstrating compliance through similarity to previously certified designs.

## Purpose

Similarity compliance shows that:
- The new design is **sufficiently similar** to an approved baseline
- Any **differences are non-critical** or have been addressed separately
- The baseline certification remains **valid** and applicable
- **Equivalence rationale** is technically justified

## Naming Convention

```
SIM-REF-<PROGRAM>-<PART>-R<NN>.pdf
```

Examples:
- `SIM-REF-A320-CENTERBODY-R01.pdf` — Similarity to A320 center body
- `SIM-REF-A350-FRAMES-R02.pdf` — Similarity to A350 frame design
- `SIM-REF-INTERNAL-TESTBED-R01.pdf` — Similarity to internal test program

## Required Content

Each similarity report should include:
1. **Baseline design** — Previously certified reference (program, part number, TC/STC)
2. **Configuration comparison** — Side-by-side comparison of key features
3. **Similarity assessment** — Material, geometry, loads, manufacturing process
4. **Differences identified** — Complete list with criticality assessment
5. **Delta compliance** — How differences are addressed (analysis, test, inspection)
6. **Certification basis** — Reference to baseline certification data
7. **Applicability justification** — Why similarity is valid for this application
8. **UTCS anchors** — Links to baseline and new configuration
9. **Approvals** — Similarity engineer, checker, design authority

## Similarity Criteria

### Material Equivalence
- Same material specification or qualified substitute
- Equivalent mechanical properties (strength, stiffness, fatigue)
- Similar processing (heat treatment, surface treatment)

### Geometric Similarity
- Same structural concept (monocoque, stiffened panel, frame)
- Similar dimensions and thickness distributions
- Equivalent load paths

### Load Similarity
- Comparable load spectra (magnitude, distribution)
- Same critical load cases (limit, ultimate, fatigue)
- Equivalent load factors and safety margins

### Manufacturing Similarity
- Same or equivalent manufacturing processes
- Similar tooling and assembly methods
- Equivalent quality control procedures

## Delta Compliance

For identified differences, provide:
- **Critical differences** — Require dedicated compliance (analysis/test)
- **Non-critical differences** — Justification of no impact on certification
- **Positive differences** — Improvements over baseline (document benefit)

## Baseline Certification Reference

Include:
- Type Certificate (TC) or Supplemental Type Certificate (STC) number
- Applicable certification basis (CS-25 amendment level)
- Original MoC records or certification summary
- EASA/FAA acceptance of baseline design

## Related

- [../../records/](../../records/) — MoC records using similarity compliance
- [../analysis/](../analysis/) — Delta analysis for critical differences
- [../service-experience/](../service-experience/) — In-service history of baseline
