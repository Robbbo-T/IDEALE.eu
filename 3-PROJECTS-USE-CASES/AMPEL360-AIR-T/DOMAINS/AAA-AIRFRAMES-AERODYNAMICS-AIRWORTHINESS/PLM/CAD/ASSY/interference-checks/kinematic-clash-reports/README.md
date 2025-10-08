# Kinematic Clash Reports — Interference Checks

This folder documents interference checks for moving assemblies, ensuring that components with motion envelopes (landing gear, control surfaces, doors, etc.) do not collide during operation.

---

## Purpose

Kinematic clash detection validates that all moving parts can traverse their full range of motion without interfering with static structures or other moving components. This is critical for flight control surfaces, retractable landing gear, cargo doors, and access panels.

---

## Contents

* **Kinematic sweep analyses** for each moving assembly
* **Motion envelope visualizations** (videos, animation snapshots)
* **Clash reports** at critical motion positions
* **Clearance margins** throughout motion paths
* **Worst-case scenarios** identification

---

## Naming Convention

Files follow the template: `INT-AAA-{ZONE}-KIN-{IDX}.{ext}`

* `{ZONE}` ∈ `{ONB|OUT}`
* `{IDX}` = 4‑digit serial (e.g., `0001`, `0042`)
* `{ext}` ∈ `{md|csv|pdf|mp4|png}`

**Examples:**
* `INT-AAA-OUT-KIN-0004.md` — Aileron sweep report
* `INT-AAA-ONB-KIN-0012.mp4` — Landing gear retraction animation
* `INT-AAA-OUT-KIN-0008.csv` — Flap deployment clearances

---

## Required Content

Each kinematic report must include:

* **UTCS Anchor**: Assembly and component IDs with revisions
* **Motion Description**: Type (rotation, translation, compound), axis, range
* **Analysis Tool**: CAD/CAE software and version
* **Critical Positions**: Fully extended, fully retracted, mid-travel
* **Minimum Clearance**: Throughout motion envelope
* **Clash Events**: Any detected interferences with timestamps in motion
* **Mitigation**: Design changes or operational limits if violations found

---

## Common Moving Assemblies

* **Landing Gear**: Main and nose gear retraction/extension
* **Control Surfaces**: Ailerons, elevators, rudders, flaps
* **Doors & Panels**: Cargo doors, access hatches, cowlings
* **Thrust Reversers**: Deployment envelopes
* **Engine Mounts**: Vibration and deflection ranges

---

## TFA Stage

**CB** (kinematic constraint enforcement) → **UE** (motion-verified snapshots)

Kinematic checks are part of **CB** validation, producing **UE** states that guarantee motion path clearance.

---

## KPIs

* **Kinematic violations** (count) across all motion envelopes
* **Minimum clearance** in motion (mm)
* **Coverage**: % of moving assemblies analyzed

---

## Status

🔄 **In Progress** — Landing gear analysis underway

---

## References

* Parent: [../README.md](../README.md)
* Related: [../digital-mockup-sims/](../digital-mockup-sims/)
* Standards: EASA CS‑25 (Appendix D), ATA Chapter 27 (Flight Controls), ATA Chapter 32 (Landing Gear)
