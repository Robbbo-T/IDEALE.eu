---

id: ASIT-AMPEL360-AIR-T-AAA-KIN-ROM
project: PRODUCTS/AMPEL360/AMPEL360_AIR_TRANSPORT
artifact: PRODUCTS/AMPEL360/AMPEL360_AIR_TRANSPORT/BWB-Q100/domains/AAA/kinematics/rom-reports/README.md
llc: SYSTEMS
classification: INTERNAL–EVIDENCE-REQUIRED
version: "1.0.0"
release_date: 2025-10-07
maintainer: "AAA Integration Team"
bridge: "QS→FWD→UE→FE→CB→QB"
ethics_guard: MAL-EEM
utcs_mi: v5.0
canonical_hash: "TBD"

---

# ROM (Range of Motion) Reports — Kinematics/AAA

## Purpose

This folder contains **formal Range of Motion (ROM) reports** that verify the maximum and minimum range of motion achieved by mechanical systems in the **AMPEL360‑AIR‑T** airframe, ensuring compliance with design requirements and operational specifications.

## Contents

* **ROM verification reports** — Documented evidence that mechanisms achieve required travel
* **Travel limit analysis** — Maximum and minimum positions achieved across operating conditions
* **Compliance matrices** — Mapping of achieved ROM to design requirements
* **Test data** — Physical test results validating kinematic models
* **Simulation results** — CAD/MBD simulation outputs demonstrating ROM capability

## Naming Convention

Files follow the pattern: `KIN-AAA-{ZONE}-ROM-{IDX}.md`

* `{ZONE}` ∈ `{ONB|OUT}` — Onboard (internal) or Outboard (external)
* `{IDX}` = 4‑digit serial number (e.g., 0001, 0002, 0003)
* Examples:
  * `KIN-AAA-OUT-ROM-0001.md` — Control surface ROM verification report
  * `KIN-AAA-ONB-ROM-0002.md` — Landing gear ROM verification report
  * `KIN-AAA-ONB-ROM-0003.md` — Door mechanism ROM verification report

## Required Artifacts

| Artifact | Source | Evidence | Status |
| :--- | :--- | :--- | :----: |
| ROM Verification Report | MBD · Test | `UTCS-MI:KIN:ROM:REPORT:v1` | 🔄 |
| Travel Limit Summary | MBD | `UTCS-MI:KIN:ROM:LIMITS:v1` | 🔄 |
| Requirement Compliance | QIP | `UTCS-MI:KIN:ROM:COMPLY:v1` | 🔄 |
| Test Data Package | Test | `UTCS-MI:KIN:ROM:TEST:v1` | 🔄 |

> **Status Legend:** 🔄 In Progress · ✅ Approved · ⏳ Pending Review · ❌ Blocked

## ROM Verification Criteria

### Control Surfaces
* **Deflection range:** Achieved vs. required angles (deg)
* **Travel linearity:** Actuator stroke vs. surface deflection relationship
* **Limit stops:** Hard stop engagement positions
* **Emergency override:** Extended travel capability in emergency modes

### Landing Gear
* **Retraction range:** Full retraction clearance into bay
* **Extension range:** Full extension and lock engagement
* **Intermediate positions:** Test position and transit positions
* **Emergency extension:** Free-fall or backup system travel

### Doors
* **Opening angle:** Maximum door swing achieved
* **Closing position:** Seal compression and lock engagement
* **Emergency operation:** Rapid egress opening capability
* **Partial opening:** Service or ventilation positions

## Verification Methods

* **CAD/MBD simulation** — Virtual verification of ROM capability
* **Physical mockup** — Full-scale or partial-scale physical verification
* **Component testing** — Bench test of mechanisms and actuators
* **Ground testing** — Aircraft-level verification during ground test
* **Flight testing** — In-flight verification of operational ROM

## Report Format

Each ROM report should include:

* **Mechanism identification** — System, subsystem, and component
* **Requirement summary** — Design requirements for ROM
* **Analysis method** — Simulation, test, or calculation approach
* **Results** — Achieved ROM with margins to requirements
* **Compliance statement** — Pass/fail assessment
* **Deviations** — Any deviations from requirements with justification
* **UTCS references** — Links to supporting evidence and models
* **Approval signatures** — Engineering and QA sign-off

## Cross-References

* **Control Surface Models** — Control surface ROM requirements
* **Landing Gear Cycles** — Landing gear ROM requirements
* **Door Mechanisms** — Door ROM requirements
* **Joint Constraints** — Joint travel limits and constraints
* **PLM/CAV/QIP** — Quality issue protocol for ROM failures

## Status

🔄 In Progress — ROM verification reports under development

---

**Related:** [Kinematics README](../README.md) · [Control Surface Models](../control-surface-models/) · [UTCS Records](../utcs/)
