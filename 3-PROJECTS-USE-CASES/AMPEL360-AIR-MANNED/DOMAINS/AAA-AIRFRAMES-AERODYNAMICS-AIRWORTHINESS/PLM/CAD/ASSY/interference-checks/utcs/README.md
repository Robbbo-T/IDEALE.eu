# UTCS Records — Interference Checks

This folder contains **canonical UTCS YAML records** for all clash reports, rulesets, and verification artifacts within the interference checks subsystem.

---

## Purpose

UTCS (Universal Traceability and Configuration System) anchors provide immutable, blockchain-backed provenance for all interference check artifacts. This directory centralizes all UTCS metadata for artifacts in the `interference-checks/` hierarchy, ensuring complete traceability from detection through resolution.

---

## Contents

* **UTCS YAML records** for clash exports, clearance violations, kinematic reports, harness routing checks, DMU simulations, rules, and resolution logs
* **Blockchain anchor references** linking artifacts to the UTCS ledger
* **Provenance chains** documenting artifact creation, modification, and approval history
* **Cryptographic hashes** for artifact integrity verification

---

## Naming Convention

Files follow the template: `UTCS-MI-{CATEGORY}-{IDX}-{VERSION}.yaml`

* `{CATEGORY}` ∈ `{CLASH|CLEAR|KIN|HARNESS|DMU|RULES|RESLOG}`
* `{IDX}` = 4‑digit serial (e.g., `0001`, `0038`)
* `{VERSION}` = version identifier (e.g., `v1`, `v2.1`)

**Examples:**
* `UTCS-MI-CLASH-MATRIX-v1.yaml` — Master clash summary matrix metadata
* `UTCS-MI-RULES-MINCLR-v1.yaml` — Minimum clearance ruleset metadata
* `UTCS-MI-KIN-0004-v1.yaml` — Kinematic sweep report metadata

---

## UTCS Record Structure

Each YAML file contains:

```yaml
utcs_id: "UTCS-MI:INT:CLASH:MATRIX:v1"
artifact_type: "interference_check"
category: "clash_export"
classification: "INTERNAL–EVIDENCE-REQUIRED"
created_date: "2025-01-15T10:30:00Z"
maintainer: "AAA Integration Team"
source_artifacts:
  - "UTCS-MI:CAD:AAA:ASSY:57-10:revC"
  - "UTCS-MI:CAD:AAA:ASSY:57-20:revB"
tfa_stage: "CB→UE"
blockchain_anchor:
  hash: "sha256:abc123..."
  block_number: 12345
  timestamp: "2025-01-15T10:35:00Z"
evidence_links:
  - type: "clash_report"
    path: "../clash-exports/INT-AAA-ONB-CLASH-0038.csv"
  - type: "resolution"
    ecr: "ECR-2024-1523"
approval_status: "approved"
approvers:
  - name: "J. Smith"
    role: "AAA Integration Lead"
    signature: "sha256:def456..."
    date: "2025-01-16T14:20:00Z"
```

---

## TFA Stage

**QS** (Quality State context) — UTCS records capture the complete context for all artifacts

All UTCS records are created at **QS** level to establish the foundational context that threads through the entire TFA flow.

---

## Integration with Blockchain

* **Anchoring**: Each UTCS record is anchored to the blockchain via `6-BLOCKCHAIN-INTEGRATION/UTCS/`
* **Immutability**: Once anchored, records cannot be modified (new versions create new anchors)
* **Verification**: Use `python 6-BLOCKCHAIN-INTEGRATION/UTCS/verify-artifact.py` to verify integrity

---

## Required for CI

All artifacts in the `interference-checks/` hierarchy **must** have corresponding UTCS records before CI validation passes. Missing UTCS records will trigger build failures.

---

## Status

🔄 **In Progress** — UTCS integration being implemented

---

## References

* Parent: [../README.md](../README.md)
* Blockchain Integration: `6-BLOCKCHAIN-INTEGRATION/UTCS/`
* Standards: UTCS-MI v5.0, EASA CS‑25
