# Clearance Violations — Interference Checks

This folder contains reports documenting instances where minimum clearance requirements were not met, along with mitigation strategies and resolution tracking.

---

## Purpose

Clearance violations represent cases where parts do not physically overlap (no clash) but fail to maintain required safety margins around moving components, high-voltage systems, hot lines, or other critical interfaces.

---

## Contents

* **Clearance violation reports** organized by zone and subsystem
* **Mitigation plans** and design change proposals
* **Compliance verification** after corrective actions
* **Thermal/EMI clearance violations** requiring special attention

---

## Naming Convention

Files follow the template: `INT-AAA-{ZONE}-CLEAR-{IDX}.{ext}`

* `{ZONE}` ∈ `{ONB|OUT}`
* `{IDX}` = 4‑digit serial (e.g., `0001`, `0038`)
* `{ext}` ∈ `{md|csv|pdf}`

**Examples:**
* `INT-AAA-ONB-CLEAR-0005.md` — Violation report with mitigation
* `INT-AAA-OUT-CLEAR-0023.csv` — Batch clearance check results

---

## Required Content

Each violation report must include:

* **UTCS Anchor**: Geometric IDs of affected parts
* **Minimum Required Clearance**: Specification reference and value
* **Measured Clearance**: Actual gap measured in DMU
* **Severity**: Critical / Major / Minor
* **Impact Assessment**: Safety, maintainability, thermal, EMI
* **Mitigation**: Proposed design changes or operational constraints
* **ECR/Deviation Link**: Change control tracking

---

## TFA Stage

**QS** (Quality State context) → **CB** (rule enforcement) → **FE** (resolution coordination)

Violations are identified via **CB** rules, coordinated through **FE**, and tracked for resolution.

---

## KPIs

* **Clearance P05 / P50 / P95** (mm) — statistical distribution of margins
* **Violation count** by severity
* **Mean time to resolution** (days)

---

## Status

🔄 **In Progress** — Clearance rules being refined

---

## References

* Parent: [../README.md](../README.md)
* Related: [../rules/](../rules/), [../resolution-logs/](../resolution-logs/)
* Standards: EASA CS‑25, ATA iSpec 2200
