---

id: ASIT-AMPEL360-AIR-T-AAA-KIN-DOOR
project: PRODUCTS/AMPEL360/AMPEL360_AIR_TRANSPORT
artifact: PRODUCTS/AMPEL360/AMPEL360_AIR_TRANSPORT/BWB-Q100/domains/AAA/kinematics/door-mechanisms/README.md
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

# Door Mechanisms — Kinematics/AAA

## Purpose

This folder contains **kinematic studies for passenger doors, cargo doors, and equipment access doors** including angles, clearances, and emergency operation modes for the **AMPEL360‑AIR‑T** airframe.

## Contents

* **Door opening/closing paths** — Full kinematic cycle from closed to fully open
* **Clearance analysis** — Door envelope vs. structure, ground equipment, and adjacent doors
* **Hinge mechanisms** — Pivot points, swing radius, and travel limits
* **Emergency modes** — Rapid egress operation and failure mode kinematics
* **Seal engagement** — Pressure seal contact and compression throughout motion

## Naming Convention

Files follow the pattern: `KIN-AAA-{ZONE}-DOOR-{IDX}.md`

* `{ZONE}` ∈ `{ONB|OUT}` — Onboard (internal) or Outboard (external)
* `{IDX}` = 4‑digit serial number (e.g., 0001, 0002, 0003)
* Examples:
  * `KIN-AAA-ONB-DOOR-0001.md` — Passenger entry door kinematics
  * `KIN-AAA-ONB-DOOR-0002.md` — Forward cargo door kinematics
  * `KIN-AAA-OUT-DOOR-0001.md` — Landing gear door kinematics

## Required Artifacts

| Artifact | Source | Evidence | Status |
| :--- | :--- | :--- | :----: |
| Door Motion Model | CAD/ASSY · MBD | `UTCS-MI:KIN:DOOR:MODEL:v1` | 🔄 |
| Opening Cycle Report | MBD | `UTCS-MI:KIN:DOOR:OPEN:v1` | 🔄 |
| Closing Cycle Report | MBD | `UTCS-MI:KIN:DOOR:CLOSE:v1` | 🔄 |
| Clearance Study | MBD · PAx | `UTCS-MI:KIN:DOOR:CLEAR:v1` | 🔄 |
| Emergency Mode Analysis | MBD | `UTCS-MI:KIN:DOOR:EMERG:v1` | 🔄 |

> **Status Legend:** 🔄 In Progress · ✅ Approved · ⏳ Pending Review · ❌ Blocked

## Door Types

* **Passenger doors** — Entry/exit doors with stairs or jetway interface
* **Emergency exits** — Rapid egress doors with emergency slide deployment
* **Cargo doors** — Large freight loading doors with powered operation
* **Landing gear doors** — Gear bay doors coordinated with landing gear cycles
* **Service doors** — Access panels for maintenance and equipment service

## Design Requirements

* **Opening time:** Passenger doors ≤ 10 seconds, emergency exits ≤ 5 seconds
* **Clearance:** Minimum clearance to structure, fuselage, and adjacent doors
* **Seal integrity:** Proper seal compression across all pressure loads
* **Emergency operation:** Manual/powered emergency opening capability
* **Ground clearance:** Door swing clear of ground service equipment

## Kinematic Analysis

* **Motion path validation** — Door envelope clear of all obstructions
* **Hinge loads** — Forces and moments within hinge and actuator limits
* **Seal contact** — Seal engagement timing and compression uniformity
* **Opening assist** — Spring/gas strut assistance for manual operation
* **Lock engagement** — Positive locking in both open and closed positions

## Verification & Validation

* **CAD interference checks** — Full motion clearance verification
* **MBD simulation** — Multibody dynamics analysis including hinge flexibility
* **Actuator performance** — Opening/closing force and time requirements
* **Emergency modes** — Manual operation and emergency deployment validation
* **Pressure testing** — Seal integrity under operational pressure differential

## Cross-References

* **PAx/ONB & PAx/OUT** — Door clearance envelope coordination
* **Landing Gear Cycles** — Landing gear door timing with gear retraction
* **PLM/CAE/MBD/actuator-models** — Door actuator specifications
* **Cabin Systems** — Passenger door interface with cabin environment

## Status

🔄 In Progress — Door mechanism kinematics under development

---

**Related:** [Kinematics README](../README.md) · [Landing Gear Cycles](../landing-gear-cycles/) · [Joint Constraints](../joint-constraints/)
