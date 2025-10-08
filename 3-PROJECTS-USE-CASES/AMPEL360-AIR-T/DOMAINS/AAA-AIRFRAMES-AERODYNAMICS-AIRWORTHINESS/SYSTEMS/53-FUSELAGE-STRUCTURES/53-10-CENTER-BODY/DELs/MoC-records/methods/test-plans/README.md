# Test Plans

This directory contains test plans and procedures for physical testing of the 53-10 Center Body.

## Purpose

Test plans define the methodology for demonstrating compliance through physical testing:
- **Static tests** — Ultimate and limit load validation
- **Fatigue tests** — Durability and damage tolerance (DT) validation
- **Environmental tests** — Temperature, humidity, corrosion resistance
- **Special tests** — Lightning strike, bird strike, crashworthiness

## Naming Convention

```
TPL-53-10-<TESTCODE>-R<NN>.pdf
```

Examples:
- `TPL-53-10-STATIC-01-R01.pdf` — Static test plan revision 01
- `TPL-53-10-DT-01-R02.pdf` — Damage tolerance test plan revision 02
- `TPL-53-10-FATIGUE-SPECTRUM-R01.pdf` — Fatigue spectrum test plan

## Required Content

Each test plan should include:
1. **Objective** — Requirements being addressed (CS-25 references)
2. **Test article** — Configuration, serial number, UTCS anchors
3. **Test setup** — Fixtures, load introduction, boundary conditions
4. **Instrumentation** — Strain gauges, LVDTs, load cells, data acquisition
5. **Load schedule** — Load cases, sequences, factors of safety
6. **Pass/fail criteria** — Acceptance thresholds, failure modes
7. **Procedures** — Step-by-step test execution instructions
8. **Safety** — Hazard analysis, safety controls, emergency procedures
9. **Data management** — Recording, storage, UTCS anchoring
10. **Approvals** — Test engineer, checker, QA, design authority

## Test Types

### Static Tests
- Ultimate load application (1.5× limit)
- Limit load validation
- Residual strength after damage

### Fatigue Tests
- Full-scale fatigue test (FSFT)
- Coupon fatigue (S-N curves)
- Crack growth rate testing

### Damage Tolerance Tests
- Initial flaw sensitivity
- Residual strength with damage
- Inspection interval validation

## Related

- [../test-results/](../test-results/) — Test reports and raw data
- [../../records/](../../records/) — MoC records referencing tests
- [../../../../../PLM/CAV/](../../../../../PLM/CAV/) — Test artifacts and QA records
