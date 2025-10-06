---

id: ASIT-AMPEL360-AIR-T-AAA-KIN-GEAR
project: PRODUCTS/AMPEL360/AMPEL360_AIR_TRANSPORT
artifact: PRODUCTS/AMPEL360/AMPEL360_AIR_TRANSPORT/BWB-Q100/domains/AAA/kinematics/landing-gear-cycles/README.md
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

# Landing Gear Cycles — Kinematics/AAA

## Purpose

This folder contains **landing gear retraction and extension kinematic models** with velocity and acceleration profiles for the **AMPEL360‑AIR‑T** main and nose landing gear systems.

## Contents

* **Retraction/extension sequences** — Complete kinematic cycles from fully extended to fully retracted
* **Velocity profiles** — Actuator and gear motion speeds throughout the cycle
* **Acceleration profiles** — Dynamic loading during retraction/extension
* **Door coordination** — Gear door timing and sequencing with gear movement
* **Emergency extension** — Free-fall or backup system kinematics

## Naming Convention

Files follow the pattern: `KIN-AAA-ONB-GEAR-{IDX}.md`

* `{IDX}` = 4‑digit serial number (e.g., 0001, 0002, 0003)
* Examples:
  * `KIN-AAA-ONB-GEAR-0001.md` — Main landing gear retraction kinematics
  * `KIN-AAA-ONB-GEAR-0002.md` — Nose landing gear retraction kinematics
  * `KIN-AAA-ONB-GEAR-0003.md` — Emergency extension kinematics

## Required Artifacts

| Artifact | Source | Evidence | Status |
| :--- | :--- | :--- | :----: |
| Gear Cycle Model | CAD/ASSY · MBD | `UTCS-MI:KIN:GEAR:MODEL:v1` | 🔄 |
| Retraction Sequence Report | MBD | `UTCS-MI:KIN:GEAR:RETRACT:v1` | 🔄 |
| Extension Sequence Report | MBD | `UTCS-MI:KIN:GEAR:EXTEND:v1` | 🔄 |
| Door Coordination Study | MBD | `UTCS-MI:KIN:GEAR:DOORS:v1` | 🔄 |
| Emergency Extension Analysis | MBD | `UTCS-MI:KIN:GEAR:EMERG:v1` | 🔄 |

> **Status Legend:** 🔄 In Progress · ✅ Approved · ⏳ Pending Review · ❌ Blocked

## Landing Gear Components

* **Main landing gear** — Primary weight-bearing gear with retraction/extension cycle
* **Nose landing gear** — Forward gear with steering capability
* **Gear doors** — Coordinated door opening/closing with gear movement
* **Actuators** — Hydraulic or electric actuators for retraction/extension
* **Locks and upstops** — Mechanical locks in up and down positions

## Design Requirements

* **Retraction time:** ≤ 12 seconds (typical for transport aircraft)
* **Extension time:** ≤ 10 seconds normal, ≤ 20 seconds emergency
* **Clearance:** No interference with structure, systems, or doors throughout cycle
* **Door coordination:** Doors open before gear movement, close after
* **Emergency extension:** Gravity or backup system deployment within time limits

## Kinematic Analysis

* **Trajectory validation** — Gear path clear of all structure and systems
* **Velocity profiles** — Peak velocities within actuator and structural limits
* **Acceleration limits** — Dynamic loads within gear and attachment design limits
* **Door timing** — Proper sequencing to avoid interference
* **Lock engagement** — Positive lock engagement in both up and down positions

## Verification & Validation

* **CAD interference checks** — Full cycle clearance verification
* **MBD simulation** — Multibody dynamics analysis of complete cycle
* **Actuator performance** — Force, speed, and power requirements verified
* **Load cases** — Kinematic performance under operational and failure loads

## Cross-References

* **Door Mechanisms** — Landing gear door kinematics coordination
* **PLM/CAE/MBD/actuator-models** — Actuator specifications and performance
* **PAx/ONB** — Internal clearance and routing requirements
* **Landing Gear System** — Hydraulic/electric system interface

## Status

🔄 In Progress — Landing gear cycle kinematics under development

---

**Related:** [Kinematics README](../README.md) · [Door Mechanisms](../door-mechanisms/) · [Actuator Interface](../actuator-interface/)
