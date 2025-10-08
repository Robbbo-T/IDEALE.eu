# Lightning Strike Package

This directory contains lightning protection and electromagnetic interference (EMI) substantiation for the 53-10 Center Body per **CS-25.1316**.

## Purpose

The lightning strike package provides comprehensive evidence for:
- Lightning strike zone identification
- Direct effects protection (structural)
- Indirect effects protection (systems)
- Bonding and grounding design
- EMI/HIRF protection
- Fuel ignition prevention

## Naming Convention

```
EMI-LIGHTNING-53-10-{REV}.pdf
BONDING-ANALYSIS-53-10-{REV}.pdf
LIGHTNING-ZONES-53-10-{REV}.pdf
```

Examples:
- `EMI-LIGHTNING-53-10-R01.pdf`
- `BONDING-ANALYSIS-53-10-R01.pdf`
- `LIGHTNING-ZONES-53-10-R01.pdf`

## CS-25.1316 Requirements

This package addresses:

### (a) Electrical and Electronic System Lightning Protection
- Protection from catastrophic effects
- System-level hazard analysis
- Component qualification

### (b) Indirect Effects
- Electromagnetic compatibility (EMC)
- Coupling paths analysis
- System susceptibility

### (c) Direct Effects
- Lightning strike zones
- Physical damage assessment
- Structural continuity

## Package Contents

### Required Documents

1. **Lightning Strike Zone Analysis**
   - Zone 1A, 1B, 1C, 2A, 2B, 3 identification
   - Strike attachment point analysis
   - Current path identification
   - Zone-specific protection requirements

2. **Direct Effects Analysis**
   - Physical damage assessment
   - Burn-through analysis
   - Structural integrity after strike
   - Composite material effects
   - Fuel tank protection

3. **Bonding and Grounding Report**
   - Electrical bonding network
   - Bonding resistance measurements
   - Grounding points identification
   - Current return paths
   - Joint bonding design

4. **Indirect Effects Analysis**
   - EMI coupling paths
   - Cable routing and shielding
   - System susceptibility levels
   - HIRF protection measures
   - Testing requirements

5. **Testing Evidence**
   - Lightning strike test results
   - Swept frequency test data
   - Bonding resistance measurements
   - Component qualification tests

### Supporting Documentation

- Lightning current waveforms (SAE ARP 5412)
- Material properties (conductivity)
- Protection methods (expanded metal, diverter strips)
- Fuel system ignition prevention
- System-level FMEA/PSSA

## Analysis Methodology

### Zone Classification
Per SAE ARP 5414:
- **Zone 1** — Initial lightning attachment areas
  - 1A: High probability, severe environment
  - 1B: High probability, severe environment (different location)
  - 1C: High probability, less severe
- **Zone 2** — Swept stroke areas
  - 2A: Severe swept stroke
  - 2B: Less severe swept stroke
- **Zone 3** — Low probability areas

### Current Levels
Per SAE ARP 5412:
- Zone 1: Up to 200 kA peak
- Zone 2: Up to 100 kA peak
- Zone 3: Residual current

### Protection Design
- Conductive surface layers
- Lightning diverter strips
- Expanded metal foil (EMF)
- Fuel tank protection
- Bonding jumpers
- Fastener treatment

## Bonding Requirements

### Bonding Resistance
- Maximum 2.5 milliohms for primary structure
- Testing per RTCA DO-160 Section 16

### Design Features
- Metal-to-metal contact
- Conductive sealants
- Bonding straps
- Fastener torque requirements
- Surface preparation

## UTCS Traceability

Each analysis must reference:
- CAD models: `UTCS-MI:CAD:AAA:ASSY:53-10:Rxx`
- Material data: `UTCS-MI:MAT:SPEC:COMPOSITE:LIGHTNING:Rxx`
- Test data: `UTCS-MI:CAV:TEST:LIGHTNING:53-10:REP`
- Zone maps: `UTCS-MI:LIGHTNING:ZONES:53-10:Rxx`

## Test Evidence

Link to test summaries in:
- `../structural-test-summaries/` — Lightning test summaries
- `../../PLM/CAV/test-reports/` — Detailed test reports

## Compliance Demonstration

This package supports compliance with:
- CS-25.1316 — Electrical and electronic system lightning protection
- CS-25.981 — Fuel tank ignition prevention
- AMC 20-136 — Protection of aircraft electrical/electronic systems
- SAE ARP 5412 — Aircraft lightning environment and related test waveforms
- SAE ARP 5414 — Aircraft lightning zoning
- RTCA DO-160 — Environmental conditions and test procedures

## Status

📋 **Ready for artifacts**

---

**Related**:
- [Parent Directory](../) — EASA Submissions overview
- [Substantiation Reports](../substantiation-reports/) — Main compliance reports
- [Structural Test Summaries](../structural-test-summaries/) — Test evidence
- [MoC Cross-Reference](../moc-cross-reference/) — Requirement mapping
