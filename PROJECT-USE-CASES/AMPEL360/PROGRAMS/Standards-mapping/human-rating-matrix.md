# Human Rating Requirements Matrix - AMPEL360 Space-T

**Version:** 2.0  
**Last Updated:** 2025-01-20  
**Certification Basis:** NASA-STD-8719.29 Rev B + ECSS-Q-ST-30C + ISO 17770

## Overview

This document maps human rating requirements from NASA, ESA, and ISO standards to the AMPEL360 Space-T orbital transfer vehicle design. Human rating ensures the vehicle meets stringent safety and reliability requirements for crewed spaceflight.

## Compliance Status Legend

- ✅ **COMPLIANT**: Full compliance demonstrated
- 🔄 **IN PROGRESS**: Compliance activities underway
- ⏳ **PLANNED**: Compliance planned for future phase
- ⚠️ **REQUIRES VALIDATION**: Design complete, validation pending
- ❌ **GAP IDENTIFIED**: Additional work required

## NASA-STD-8719.29: Human Rating Requirements for Space Systems

### Section 3: General Requirements

| Req ID | Requirement | Status | Compliance Approach | Evidence | Notes |
|--------|-------------|--------|---------------------|----------|-------|
| 3.1.1 | Human Rating Plan | 🔄 | Document development | HRP v1.0 (draft) | Final by 2026 Q2 |
| 3.1.2 | Risk Management | 🔄 | PRA in progress | PRA framework | Continuous update |
| 3.1.3 | Safety & Mission Assurance | 🔄 | S&MA plan active | Safety reviews quarterly | Established |
| 3.1.4 | Systems Engineering | ✅ | MBSE implementation | SysML models | 3DEXPERIENCE |
| 3.1.5 | Verification & Validation | 🔄 | V&V plan | Test program defined | Execution 2026-2030 |

### Section 4: Safety

#### 4.1 Hazard Analysis

| Req ID | Requirement | Status | Compliance Approach | Evidence | Notes |
|--------|-------------|--------|---------------------|----------|-------|
| 4.1.1 | Preliminary Hazard Analysis | ✅ | PHA completed | PHA Report Rev A | 150 hazards identified |
| 4.1.2 | System Hazard Analysis | 🔄 | SHA in progress | SHA Report (draft) | Due 2026 Q1 |
| 4.1.3 | Subsystem Hazard Analysis | ⏳ | Planned | Templates ready | Start 2026 Q2 |
| 4.1.4 | Operating & Support Hazard Analysis | ⏳ | Planned | Part of O&SHA | 2027-2028 |

#### 4.2 Safety Requirements

| Req ID | Requirement | Status | Compliance Approach | Evidence | Target |
|--------|-------------|--------|---------------------|----------|--------|
| 4.2.1 | Loss of Crew (LOC) | ⚠️ | Design + PRA | Analysis ongoing | <1:500 (0.2%) |
| 4.2.2 | Loss of Mission (LOM) | ⚠️ | Design + PRA | Analysis ongoing | <1:100 (1%) |
| 4.2.3 | Catastrophic Hazards | 🔄 | Elimination/control | Design features | Cat I eliminated |
| 4.2.4 | Critical Hazards | 🔄 | Control to acceptable | Redundancy/barriers | Cat II controlled |
| 4.2.5 | Emergency Egress | ⏳ | Timelines defined | Procedure drafts | <5 min on-orbit |

#### 4.3 Abort and Contingency

| Req ID | Requirement | Status | Compliance Approach | Evidence | Notes |
|--------|-------------|--------|---------------------|----------|-------|
| 4.3.1 | Launch Abort System | 🔄 | LAS design complete | Solid rocket motors | Qualification 2027 |
| 4.3.2 | Ascent Abort Modes | 🔄 | Flight software | Abort trajectories | Pad to orbit |
| 4.3.3 | On-Orbit Contingencies | ⏳ | Procedures development | Safe haven 24hr | Validation 2028 |
| 4.3.4 | Entry Abort Modes | 🔄 | Landing site analysis | Offshore contingency | Atlantic/Pacific |
| 4.3.5 | Abort Reliability | ⚠️ | PRA analysis | Abort success >99.9% | Analysis 2026-2027 |

### Section 5: Design

#### 5.1 General Design

| Req ID | Requirement | Status | Compliance Approach | Evidence | Notes |
|--------|-------------|--------|---------------------|----------|-------|
| 5.1.1 | Human-Centered Design | 🔄 | Crew involvement | Human factors | Ongoing reviews |
| 5.1.2 | Design for Minimum Risk | ✅ | Design philosophy | Safety by design | Baseline approach |
| 5.1.3 | Fault Tolerance | 🔄 | Redundancy analysis | FMECA | Critical: 3-fault tolerant |
| 5.1.4 | Single Point Failures | 🔄 | FMECA | SPF list (draft) | Target: zero SPFs |
| 5.1.5 | Common Cause Failures | 🔄 | Zonal analysis | Separation studies | Physical/functional |

#### 5.2 Structural Design

| Req ID | Requirement | Status | Compliance Approach | Evidence | Notes |
|--------|-------------|--------|---------------------|----------|-------|
| 5.2.1 | Structural Safety Factor | ✅ | 1.4 ultimate | Analysis complete | NASA-STD-5001B |
| 5.2.2 | Fracture Control | 🔄 | Fracture control plan | Material selection | Safe-life/fail-safe |
| 5.2.3 | Loads Definition | 🔄 | Loads analysis | Structural loads doc | Launch, ascent, entry |
| 5.2.4 | Pressure Vessel Design | 🔄 | ASME BPVC | Cabin structure | 4x proof pressure test |
| 5.2.5 | Micrometeoroid/Debris | 🔄 | Shield design | Whipple shield | NASA STD-8719.14 |

#### 5.3 Propulsion

| Req ID | Requirement | Status | Compliance Approach | Evidence | Notes |
|--------|-------------|--------|---------------------|----------|-------|
| 5.3.1 | Propulsion Reliability | ⚠️ | Raptor heritage | SpaceX data review | Methane/LOX proven |
| 5.3.2 | Engine-Out Capability | 🔄 | 4-engine config | Redundancy analysis | 1 engine-out capable |
| 5.3.3 | Propellant Loading | ⏳ | Procedures dev | Ground ops manual | 2028 |
| 5.3.4 | Leak Detection | 🔄 | Sensor suite | Helium mass spec | CH4, LOX, hypergolic |
| 5.3.5 | Fire Suppression | 🔄 | Clean agent system (e.g., Novec 1230, inert gas, or water mist) | Fire test plan | Engine bay + cabin |

#### 5.4 Environmental Control & Life Support (ECLSS)

| Req ID | Requirement | Status | Compliance Approach | Evidence | Notes |
|--------|-------------|--------|---------------------|----------|-------|
| 5.4.1 | Atmosphere Control | 🔄 | Closed-loop design | ISS heritage | 180-day capability |
| 5.4.2 | Water Recovery | 🔄 | 95% recovery target | Testing 2026-2027 | Distillation + filter |
| 5.4.3 | Oxygen Generation | 🔄 | Water electrolysis | OGS design | 2.5 kg O2/day |
| 5.4.4 | CO2 Removal | 🔄 | 4-bed molecular sieve | Qualification testing | ISS heritage |
| 5.4.5 | Trace Contaminant Control | 🔄 | Activated charcoal | TCCS design | Cabin air quality |
| 5.4.6 | Temperature Control | 🔄 | Active thermal | Radiators + pumps | 18-26°C |
| 5.4.7 | Humidity Control | 🔄 | Condensing heat exchanger | CHX design | 30-70% RH |
| 5.4.8 | ECLSS Redundancy | 🔄 | Dual-loop config | 1-fault tolerant | Critical functions |
| 5.4.9 | Emergency Life Support | 🔄 | 48hr emergency O2 | Backup systems | Beyond 24hr req |

#### 5.5 Crew Systems

| Req ID | Requirement | Status | Compliance Approach | Evidence | Notes |
|--------|-------------|--------|---------------------|----------|-------|
| 5.5.1 | Crew Accommodations | 🔄 | Interior layout | Mockup testing | 20 persons (18+2) |
| 5.5.2 | Crew Habitability | 🔄 | NASA-STD-3001 | Human factors eval | Volume 2 |
| 5.5.3 | Crew Safety Equipment | ⏳ | Equipment spec | PPE, EVA suits | 2027 |
| 5.5.4 | Food & Water Supply | 🔄 | Consumables calc | 180-day mission | +30% margin |
| 5.5.5 | Waste Management | 🔄 | WCS design | ISS heritage | Solid + liquid |
| 5.5.6 | Sleep Accommodations | 🔄 | Sleep stations | 10 stations | Shifts for 20 crew |
| 5.5.7 | Crew Health Care | ⏳ | Medical kit spec | Telemedicine | 2027 |

#### 5.6 Avionics & Software

| Req ID | Requirement | Status | Compliance Approach | Evidence | Notes |
|--------|-------------|--------|---------------------|----------|-------|
| 5.6.1 | Flight Software Class | 🔄 | Safety-critical | NASA-STD-8739.8 | Class A software |
| 5.6.2 | Software Assurance | 🔄 | SQA plan | IV&V required | Independent V&V |
| 5.6.3 | Computer Redundancy | ✅ | Triple redundant | Architecture design | Vote 2-of-3 |
| 5.6.4 | GN&C Accuracy | 🔄 | Requirements flow | Analysis ongoing | Docking ±10cm |
| 5.6.5 | Autonomous Operations | 🔄 | Auto rendezvous | Software dev | Dragon heritage |

#### 5.7 Communications

| Req ID | Requirement | Status | Compliance Approach | Evidence | Notes |
|--------|-------------|--------|---------------------|----------|-------|
| 5.7.1 | Communication Redundancy | ✅ | S-band + Ka-band | Dual-string | Independent paths |
| 5.7.2 | Voice Communication | 🔄 | VHF + UHF | Radio suite | Launch, entry, EVA |
| 5.7.3 | Data Communication | 🔄 | High-rate downlink | Ka-band 300 Mbps | Telemetry + video |
| 5.7.4 | Emergency Communication | 🔄 | Backup comm | COSPAS-SARSAT | Search & rescue |

### Section 6: Verification

#### 6.1 Verification Program

| Req ID | Requirement | Status | Compliance Approach | Evidence | Notes |
|--------|-------------|--------|---------------------|----------|-------|
| 6.1.1 | Verification Plan | 🔄 | Master verification plan | MVP draft | Rev by 2026 Q1 |
| 6.1.2 | Test-Like-You-Fly | ✅ | Test philosophy | Flight-like hardware | Qualification units |
| 6.1.3 | Environmental Testing | ⏳ | Test matrix | Thermal vac, vibe | 2027-2028 |
| 6.1.4 | Integrated Testing | ⏳ | Vehicle-level | Ground test program | 2028-2029 |

#### 6.2 Flight Testing

| Req ID | Requirement | Status | Compliance Approach | Evidence | Timeline |
|--------|-------------|--------|---------------------|----------|----------|
| 6.2.1 | Uncrewed Flight Tests | ⏳ | 5 missions planned | Test objectives defined | 2027-2028 |
| 6.2.2 | Crewed Demonstration | ⏳ | 3 missions planned | Professional astronauts | 2029-2030 |
| 6.2.3 | Flight Readiness Review | ⏳ | FRR process | Review criteria defined | Before each mission |
| 6.2.4 | Anomaly Resolution | 🔄 | Problem tracking | Anomaly database | Continuous |

### Section 7: Operations

#### 7.1 Flight Operations

| Req ID | Requirement | Status | Compliance Approach | Evidence | Notes |
|--------|-------------|--------|---------------------|----------|-------|
| 7.1.1 | Crew Training | ⏳ | Training program plan | Simulator spec | Start 2027 |
| 7.1.2 | Mission Rules | ⏳ | Mission rules doc | Flight rules framework | 2028 |
| 7.1.3 | Flight Procedures | ⏳ | Ops manual | Procedure templates | 2028-2029 |
| 7.1.4 | Mission Control | ⏳ | MCC setup | Control center design | Bremen/Houston |

#### 7.2 Medical Operations

| Req ID | Requirement | Status | Compliance Approach | Evidence | Notes |
|--------|-------------|--------|---------------------|----------|-------|
| 7.2.1 | Medical Selection | ⏳ | Medical standards | ESA/NASA standards | 2027 |
| 7.2.2 | Crew Health | ⏳ | Health monitoring | Telemedicine | In-flight |
| 7.2.3 | Countermeasures | 🔄 | Exercise equipment | Specs defined | Bone/muscle loss |

## ECSS-Q-ST-30C: Dependability

### Reliability

| Req ID | Requirement | Status | Compliance Approach | Target | Notes |
|--------|-------------|--------|---------------------|--------|-------|
| 5.2.1 | Reliability Prediction | 🔄 | Reliability modeling | >99.8% mission success | Analysis 2026-2027 |
| 5.2.2 | Reliability Allocation | 🔄 | Allocation by subsystem | Budget defined | Fault tree analysis |
| 5.2.3 | Parts Selection | 🔄 | Parts list (EPPL) | Space-grade parts | MIL-PRF-38534 |
| 5.2.4 | Derating | ✅ | Derating policy | Conservative margins | 50% electrical |

### Maintainability

| Req ID | Requirement | Status | Compliance Approach | Evidence | Notes |
|--------|-------------|--------|---------------------|----------|-------|
| 5.3.1 | Maintainability Design | 🔄 | Design for maintenance | Access provisions | Quick turnaround |
| 5.3.2 | Maintenance Plan | ⏳ | Maintenance procedures | Draft manual | 2028 |
| 5.3.3 | Built-In Test | 🔄 | BIT implementation | Self-diagnostics | 95% fault isolation |

### Safety

| Req ID | Requirement | Status | Compliance Approach | Evidence | Notes |
|--------|-------------|--------|---------------------|----------|-------|
| 5.4.1 | Safety Assessment | 🔄 | System safety program | SSP plan | Continuous |
| 5.4.2 | Safety Case | ⏳ | Safety case document | Template defined | Build progressively |
| 5.4.3 | Safety Reviews | 🔄 | Review schedule | Quarterly reviews | Established |

## ISO 17770: Space Systems - Human Rating Process

### Process Requirements

| Clause | Requirement | Status | Compliance Approach | Evidence | Notes |
|--------|-------------|--------|---------------------|----------|-------|
| 5.1 | Human Rating Plan | 🔄 | HRP document | Draft v1.0 | Update quarterly |
| 5.2 | Design Requirements | 🔄 | Requirements database | 2500+ requirements | DOORS Next |
| 5.3 | Verification Requirements | 🔄 | Verification matrix | Traceability complete | MBSE tool |
| 5.4 | Documentation | 🔄 | Document tree | 80% complete | Target 100% by 2026 |

### Human Rating Certification

| Phase | Requirement | Status | Timeline | Evidence | Gate |
|-------|-------------|--------|----------|----------|------|
| Phase 1 | Preliminary Design Review | ✅ | Completed 2025 Q4 | PDR package | Passed |
| Phase 2 | Critical Design Review | ⏳ | 2026 Q2 | CDR package | Planned |
| Phase 3 | Flight Qualification Review | ⏳ | 2028 Q4 | FQR package | After 5 uncrewed |
| Phase 4 | Human Rating Certification Review | ⏳ | 2030 Q2 | HRCR package | After 3 crewed |

## Probabilistic Risk Assessment (PRA)

### Loss of Crew (LOC) Analysis

| Mission Phase | Current Estimate | Target | Status | Key Contributors |
|---------------|------------------|--------|--------|------------------|
| Pad Operations | 1:5000 | <1:5000 | ✅ | LAS, ground safety |
| Ascent | 1:400 | <1:500 | ⚠️ | Propulsion, structures |
| On-Orbit | 1:10000 | <1:5000 | ✅ | MMOD, systems |
| Entry | 1:600 | <1:500 | ⚠️ | TPS, GN&C |
| Landing | 1:2000 | <1:2000 | ✅ | Parachutes, touchdown |
| **Total Mission** | **1:480** | **<1:500** | ⚠️ | **Refinement needed** |

**Mitigation Actions:**
1. **Ascent LOC**: Enhance propulsion redundancy analysis (2026 Q1)
2. **Entry LOC**: Additional TPS testing, GN&C validation (2026-2027)
3. **Overall**: Refine fault tree, incorporate test data (ongoing)

### Loss of Mission (LOM) Analysis

| Mission Phase | Current Estimate | Target | Status |
|---------------|------------------|--------|--------|
| Total Mission | 1:120 | <1:100 | ⚠️ |

**Key Drivers:**
- ECLSS reliability (180-day mission)
- Propulsion system margin
- Communications redundancy

## Test & Validation Summary

### Ground Testing (2026-2028)

```yaml
structural_testing:
  - Static load test: Ultimate loads
  - Vibration: Launch/ascent profile
  - Acoustic: 150 dB
  - Shock: Pyro events
  investment: "€100M"

environmental_testing:
  - Thermal vacuum: -150°C to +120°C
  - Thermal cycling: 100 cycles
  - MMOD impact: Hypervelocity testing
  investment: "€80M"

systems_testing:
  - ECLSS 90-day ground demo
  - Propulsion hot-fire (50+ tests)
  - Avionics integrated testing
  investment: "€150M"
```

### Flight Testing (2027-2030)

```yaml
uncrewed_missions:
  demo_1: "Orbital flight test (7 days)"
  demo_2: "Extended duration (30 days)"
  demo_3: "60-day mission"
  demo_4_5: "Reliability/variability (2 missions)"
  investment: "€800M"

crewed_missions:
  cd_1: "First crewed (2 crew, 7 days)"
  cd_2: "Extended crew (4 crew, 14 days)"
  cd_3: "Full duration (4 crew, 30 days)"
  investment: "€1.2B"
```

## Certification Timeline

```yaml
key_milestones:
  2025_q4: "PDR Complete ✅"
  2026_q2: "CDR Planned ⏳"
  2027_q1: "Qualification Testing Start ⏳"
  2027_q4: "First Uncrewed Flight ⏳"
  2028_q4: "Flight Qualification Review ⏳"
  2029_q1: "First Crewed Flight ⏳"
  2030_q2: "Human Rating Certification ⏳"
  2030_q4: "Commercial Operations ⏳"
```

## Risk Summary

### Top 10 Human Rating Risks

| Rank | Risk | Probability | Impact | Mitigation |
|------|------|-------------|--------|------------|
| 1 | LOC > 1:500 | MEDIUM | CRITICAL | Enhanced redundancy, testing |
| 2 | ECLSS 180-day reliability | MEDIUM | HIGH | Extended ground testing |
| 3 | Entry TPS degradation | LOW | CRITICAL | Additional testing, margin |
| 4 | Abort system reliability | LOW | CRITICAL | Extensive qualification |
| 5 | MMOD penetration | LOW | HIGH | Shield validation |
| 6 | Propulsion human-rating | LOW | HIGH | Heritage leveraging |
| 7 | Software certification | MEDIUM | HIGH | IV&V, extensive testing |
| 8 | Crew medical events | LOW | MEDIUM | Selection, monitoring |
| 9 | NASA/ESA requirements change | MEDIUM | MEDIUM | Early engagement |
| 10 | Schedule delays | MEDIUM | MEDIUM | Contingency planning |

---

## Summary & Recommendations

### Current Status
- **Overall Maturity**: Design phase (PDR complete)
- **Human Rating Readiness**: 40% (design basis established)
- **Key Strength**: Strong heritage (ISS ECLSS, SpaceX propulsion)
- **Key Challenge**: LOC analysis refinement needed

### Path to Human Rating Certification

**2025-2026: Design Finalization**
- Complete CDR (Q2 2026)
- Finalize PRA (target LOC <1:500)
- Complete hazard analyses
- Freeze design baseline

**2026-2028: Qualification Testing**
- Ground test campaign
- Uncrewed flight demonstrations
- System reliability validation
- Anomaly resolution

**2028-2030: Crewed Demonstration**
- Professional crew missions
- Operational procedures validation
- Performance verification
- Human Rating Certification Review

**2030+: Commercial Operations**
- Fleet operations (3 vehicles)
- Continuous improvement
- 5-year recertification cycle

### Investment Summary
- **Ground Testing**: €330M
- **Flight Testing**: €2.0B
- **Certification Program**: €500M
- **Total**: €2.83B

---

**Document Control:**
- **Version:** 2.0
- **Approval:** AMPEL360 Human Rating Board + NASA/ESA (as engagement progresses)
- **Next Review:** Quarterly updates through certification
