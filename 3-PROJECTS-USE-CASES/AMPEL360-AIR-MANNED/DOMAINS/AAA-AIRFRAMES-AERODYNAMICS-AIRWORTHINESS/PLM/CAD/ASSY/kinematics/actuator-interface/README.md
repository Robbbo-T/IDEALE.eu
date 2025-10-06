---

id: ASIT-AMPEL360-AIR-T-AAA-KIN-ACT
project: PRODUCTS/AMPEL360/AMPEL360_AIR_TRANSPORT
artifact: PRODUCTS/AMPEL360/AMPEL360_AIR_TRANSPORT/BWB-Q100/domains/AAA/kinematics/actuator-interface/README.md
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

# Actuator Interface — Kinematics/AAA

## Purpose

This folder contains **actuator input/output travel and force profiles** defining the interface between kinematic mechanisms and their actuation systems, with links to **PLM/CAE/MBD/actuator-models** for the **AMPEL360‑AIR‑T** airframe.

## Contents

* **Travel requirements** — Input/output displacement requirements for actuators
* **Force/torque profiles** — Required forces and torques throughout motion cycle
* **Velocity profiles** — Speed requirements for actuator extension/retraction
* **Power requirements** — Hydraulic flow, electric power, or pneumatic pressure needs
* **Actuator coordination** — Multi-actuator systems with synchronized motion

## Naming Convention

Files follow the pattern: `KIN-AAA-{ZONE}-ACT-{IDX}.md`

* `{ZONE}` ∈ `{ONB|OUT}` — Onboard (internal) or Outboard (external)
* `{IDX}` = 4‑digit serial number (e.g., 0001, 0002, 0003)
* Examples:
  * `KIN-AAA-OUT-ACT-0001.md` — Aileron actuator interface requirements
  * `KIN-AAA-ONB-ACT-0002.md` — Landing gear retraction actuator interface
  * `KIN-AAA-ONB-ACT-0003.md` — Door actuator interface specification

## Required Artifacts

| Artifact | Source | Evidence | Status |
| :--- | :--- | :--- | :----: |
| Actuator Travel Spec | MBD · CAD | `UTCS-MI:KIN:ACT:TRAVEL:v1` | 🔄 |
| Force/Torque Profile | MBD · CAE | `UTCS-MI:KIN:ACT:FORCE:v1` | 🔄 |
| Velocity Profile | MBD | `UTCS-MI:KIN:ACT:VEL:v1` | 🔄 |
| Power Budget | Systems | `UTCS-MI:KIN:ACT:POWER:v1` | 🔄 |
| Coordination Logic | Systems | `UTCS-MI:KIN:ACT:COORD:v1` | 🔄 |

> **Status Legend:** 🔄 In Progress · ✅ Approved · ⏳ Pending Review · ❌ Blocked

## Actuator Types

* **Hydraulic linear actuators** — High-force linear motion (landing gear, flaps)
* **Electric linear actuators** — Medium-force linear motion (control surfaces)
* **Rotary actuators** — Direct rotary motion (spoiler rotation)
* **Ball screw actuators** — High-precision linear motion (trim surfaces)
* **Multi-position actuators** — Discrete position actuators (doors, latches)

## Interface Requirements

### Travel Parameters
* **Stroke length** — Total actuator extension/retraction distance
* **Position resolution** — Minimum controllable position increment
* **End stops** — Mechanical or electronic travel limits
* **Home position** — Reference position for initialization

### Force/Torque Parameters
* **Static force** — Force required to hold position under load
* **Dynamic force** — Force required during motion
* **Peak force** — Maximum force during motion cycle (e.g., door seal compression)
* **Stall force** — Maximum force actuator can produce
* **Force margin** — Design margin over required force (typically 1.5x)

### Velocity Parameters
* **Maximum velocity** — Peak speed during motion
* **Acceleration** — Required acceleration and deceleration rates
* **Motion profile** — Trapezoidal, S-curve, or custom velocity profile
* **Settling time** — Time to stabilize at target position

### Power Requirements
* **Hydraulic:** Flow rate (L/min), pressure (bar), fluid type
* **Electric:** Voltage (V), current (A), power (W), duty cycle
* **Pneumatic:** Flow rate (SCFM), pressure (psi), air quality

## Design Considerations

* **Actuator sizing** — Selection based on force, stroke, and speed requirements
* **Mounting interface** — Attachment points and load path
* **Position feedback** — LVDT, RVDT, encoder, or potentiometer
* **Failure modes** — Jam-safe, fail-safe, or fail-operational requirements
* **Redundancy** — Single, dual, or triple actuator configurations

## Verification & Validation

* **Kinematic simulation** — MBD analysis with actuator models
* **Force analysis** — FEA or analytical calculation of required forces
* **Performance testing** — Bench test of actuator with representative loads
* **System integration** — Testing with actual control system and power source

## Cross-References

* **PLM/CAE/MBD/actuator-models** — Detailed actuator performance models
* **Control Surface Models** — Surface actuation requirements
* **Landing Gear Cycles** — Gear retraction actuator requirements
* **Door Mechanisms** — Door actuator specifications
* **Systems/Hydraulics** — Hydraulic system interface
* **Systems/Electrical** — Electric power distribution

## Status

🔄 In Progress — Actuator interface definitions under development

---

**Related:** [Kinematics README](../README.md) · [Control Surface Models](../control-surface-models/) · [Joint Constraints](../joint-constraints/)
