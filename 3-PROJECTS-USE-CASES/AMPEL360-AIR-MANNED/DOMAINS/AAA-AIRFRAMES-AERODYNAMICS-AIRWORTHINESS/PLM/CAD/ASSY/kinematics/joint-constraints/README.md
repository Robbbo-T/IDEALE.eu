---

id: ASIT-AMPEL360-AIR-T-AAA-KIN-JOINT
project: PRODUCTS/AMPEL360/AMPEL360_AIR_TRANSPORT
artifact: PRODUCTS/AMPEL360/AMPEL360_AIR_TRANSPORT/BWB-Q100/domains/AAA/kinematics/joint-constraints/README.md
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

# Joint Constraints — Kinematics/AAA

## Purpose

This folder contains **mechanical joint limit definitions, stiffness properties, backlash allowances, and clearance specifications** for all kinematic mechanisms in the **AMPEL360‑AIR‑T** airframe.

## Contents

* **Joint limit definitions** — Maximum and minimum travel limits for all joints
* **Stiffness characteristics** — Rotational and translational stiffness at joints
* **Backlash allowances** — Acceptable play in joints and linkages
* **Clearance specifications** — Minimum clearances for bearing surfaces and mating parts
* **Hard and soft stops** — Physical stops and control system limits

## Naming Convention

Files follow the pattern: `KIN-AAA-{ZONE}-JOINT-{IDX}.md`

* `{ZONE}` ∈ `{ONB|OUT}` — Onboard (internal) or Outboard (external)
* `{IDX}` = 4‑digit serial number (e.g., 0001, 0002, 0003)
* Examples:
  * `KIN-AAA-OUT-JOINT-0001.md` — Control surface hinge constraints
  * `KIN-AAA-ONB-JOINT-0002.md` — Landing gear pivot joint limits
  * `KIN-AAA-ONB-JOINT-0003.md` — Door hinge constraint definition

## Required Artifacts

| Artifact | Source | Evidence | Status |
| :--- | :--- | :--- | :----: |
| Joint Limit Definition | CAD/ASSY | `UTCS-MI:KIN:JOINT:LIMITS:v1` | 🔄 |
| Stiffness Matrix | CAE/FEA | `UTCS-MI:KIN:JOINT:STIFF:v1` | 🔄 |
| Backlash Specification | Design Std | `UTCS-MI:KIN:JOINT:BACKLASH:v1` | 🔄 |
| Clearance Requirements | Design Std | `UTCS-MI:KIN:JOINT:CLEAR:v1` | 🔄 |

> **Status Legend:** 🔄 In Progress · ✅ Approved · ⏳ Pending Review · ❌ Blocked

## Joint Types

* **Revolute joints** — Single-axis rotation (hinges, pivots)
* **Prismatic joints** — Linear translation (slides, actuators)
* **Spherical joints** — Multi-axis rotation (ball joints)
* **Universal joints** — Two-axis rotation (U-joints, Cardan joints)
* **Complex linkages** — Multi-bar mechanisms with combined motion

## Constraint Parameters

### Travel Limits
* **Hard stops** — Physical mechanical limits
* **Soft stops** — Control system limits before hard stops
* **Emergency overtravel** — Allowable overtravel in emergency conditions
* **Manufacturing tolerances** — Limit variation due to tolerances

### Stiffness
* **Rotational stiffness** — Resistance to angular displacement (Nm/rad)
* **Translational stiffness** — Resistance to linear displacement (N/mm)
* **Elastic deformation** — Allowable elastic deflection under load
* **Preload** — Initial load in bearings and joints

### Backlash & Clearance
* **Backlash** — Free play in gears, linkages, and actuators
* **Bearing clearance** — Radial and axial clearance in bearings
* **Joint clearance** — Gap at mating surfaces
* **Wear allowance** — Increased clearance over service life

## Design Standards

* **Control surfaces:** Backlash ≤ 0.5° in linkages
* **Landing gear:** Joint clearance within bearing manufacturer specs
* **Doors:** Hinge backlash ≤ 1mm linear equivalent
* **Actuators:** Rod end backlash per MS/NAS standards

## Verification & Validation

* **CAD tolerance stackup** — Worst-case and statistical analysis
* **FEA joint stiffness** — Structural stiffness at joint locations
* **Physical testing** — Joint clearance and backlash measurement
* **Wear testing** — Long-term durability and clearance growth

## Cross-References

* **Control Surface Models** — Surface hinge joint constraints
* **Landing Gear Cycles** — Gear joint and actuator constraints
* **Door Mechanisms** — Door hinge and latch joint constraints
* **PLM/CAE/FEA** — Structural stiffness and deformation analysis

## Status

🔄 In Progress — Joint constraint definitions under development

---

**Related:** [Kinematics README](../README.md) · [Control Surface Models](../control-surface-models/) · [Actuator Interface](../actuator-interface/)
