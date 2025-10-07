# UTCS Records

This directory contains UTCS (Universal Traceability and Configuration System) YAML records for all EASA submission packages related to the 53-10 Center Body.

## Purpose

UTCS records provide immutable, blockchain-anchored traceability for certification artifacts, ensuring:
- Complete provenance chain from source data to submission
- Content integrity verification (SHA-256 hashing)
- Version control and configuration management
- Regulatory audit trail
- Evidence linkage across the TFA model (CB → CAV → UE)

## Naming Convention

```
EASA-53-10-SUB-{YYYY}-{SEQ}.yaml
```

Examples:
- `EASA-53-10-SUB-2025-001.yaml`
- `EASA-53-10-SUB-2025-002.yaml`

## UTCS Record Structure

Each YAML file follows the UTCS Canon schema with these key sections:

### Schema and Metadata
```yaml
schema_version: "1.0"
utcs_id: "UTCS-MI:DEL:EASA:53-10:SUB:2025:001:v1"
product: "AMPEL360-AIR-T"
domain: "AAA"
zone: "53-FUSELAGE-STRUCTURES"
subzone: "53-10-CENTER-BODY"
```

### Bridge and Path
```yaml
bridge: "QS→FWD→UE→FE→CB→QB"
primary_path: "CB→CAV→UE"
```

### Provenance
```yaml
provenance:
  owner: "AAA Certification Team"
  signatories:
    - name: "Chief of Structures"
      role: "Approver"
    - name: "Head of Airworthiness"
      role: "Certifying Authority"
  created: "2025-02-01T12:00:00Z"
  updated: "2025-02-01T12:00:00Z"
```

### Content
```yaml
content:
  title: "EASA Submission 53-10 — Static Strength & Lightning Compliance"
  scope:
    cs_requirements: ["CS-25.561", "CS-25.571", "CS-25.603", "CS-25.607", "CS-25.1316"]
    moc: 
      CS-25.561: "A"
      CS-25.571: "A/T"
      CS-25.1316: "A"
  files:
    cover_letter: "cover-letters/EASA-53-10-SUB-2025-001-cover.pdf"
    checklist: "compliance-checklists/EASA-53-10-CHK-2025-001.xlsx"
    substantiation:
      - "substantiation-reports/SUBST-53-10-STATIC-STRENGTH-R01.pdf"
    bundle: "submissions/EASA-53-10-SUB-2025-001-STATIC-STRENGTH.zip"
```

### Threading (Traceability Anchors)
```yaml
threading:
  anchors:
    fem_static: "UTCS-MI:CAE:AAA:FEM:53-10:STATIC:R01"
    fem_fatigue: "UTCS-MI:CAE:AAA:FEM:53-10:FATIGUE:R02"
    test_static: "UTCS-MI:CAV:TEST:53-10:STATIC:REP"
    cav_qip: "UTCS-MI:CAV:QIP:53-10:H3"
  sources_hash:
    SUBST-53-10-STATIC-STRENGTH-R01.pdf: "<sha256>"
    EASA-53-10-SUB-2025-001-STATIC-STRENGTH.zip: "<sha256>"
```

### Security
```yaml
security:
  classification: "INTERNAL–EVIDENCE-REQUIRED"
  access:
    read: ["certification", "structures", "quality"]
    write: ["AAA Certification Team"]
```

### Status
```yaml
status:
  review: "in_internal_review"
  authority_reference: "EASA-APP-<TBD>"
  submission_date: "2025-02-15T00:00:00Z"
  acceptance_date: null
```

## UTCS ID Format

```
UTCS-MI:DEL:EASA:{ZONE}:SUB:{YYYY}:{SEQ}:v{VERSION}
```

Components:
- **UTCS-MI** — UTCS Mission Identifier
- **DEL** — Deliverable artifact type
- **EASA** — Authority identifier
- **{ZONE}** — ATA zone (e.g., 53-10)
- **SUB** — Submission type
- **{YYYY}** — Year
- **{SEQ}** — Sequential number (001, 002, ...)
- **v{VERSION}** — Version number

Example: `UTCS-MI:DEL:EASA:53-10:SUB:2025:001:v1`

## Validation

UTCS records are validated for:

### Automated Checks (CI/CD)
- [ ] Schema validation against UTCS v5.0 schema
- [ ] ID uniqueness within repository
- [ ] Hash verification (computed vs. declared)
- [ ] Reference integrity (all anchors exist)
- [ ] Version consistency (semantic versioning)
- [ ] Date logic (modified ≥ created)
- [ ] File existence (all referenced files exist)

### Manual Review
- [ ] Traceability completeness
- [ ] Classification accuracy
- [ ] All required approvals obtained
- [ ] Evidence chain is complete
- [ ] CS-25 requirement coverage

## Hash Computation

Generate SHA-256 hashes for all artifacts:

```bash
# Single file hash
sha256sum SUBST-53-10-STATIC-STRENGTH-R01.pdf

# Batch hash computation
find ../substantiation-reports -type f -exec sha256sum {} \; > hashes.txt
```

Include hashes in the `threading.sources_hash` section of the UTCS record.

## Evidence Chain

Each UTCS record must establish a complete evidence chain:

```
Requirements (CS-25.xxx)
    ↓
Analysis (FEM/CAE)
    ↓  UTCS-MI:CAE:AAA:FEM:53-10:xxx
Testing (CAV)
    ↓  UTCS-MI:CAV:TEST:53-10:xxx
Substantiation Reports
    ↓  [files in ../substantiation-reports/]
MoC Matrix
    ↓  [in ../moc-cross-reference/]
Submission Package
    ↓  [in ../submissions/]
UTCS Record
    ↓  UTCS-MI:DEL:EASA:53-10:SUB:2025:xxx
Authority Acceptance
```

## Blockchain Anchoring

Future implementation will include:
- Content hash anchoring on blockchain
- Timestamp proof of artifact existence
- Immutable audit trail
- Smart contract validation
- Tamper detection

## Integration with Evidence Framework

UTCS records integrate with the IDEALE Evidence Framework:

```bash
# Validate UTCS record
python evidence-engine/utcs-validator/validate-utcs.py \
  --record utcs/EASA-53-10-SUB-2025-001.yaml

# Generate UTCS record from submission package
python evidence-engine/utcs-generator/create-utcs-record.py \
  --package ../submissions/EASA-53-10-SUB-2025-001-STATIC-STRENGTH.zip \
  --template easa-submission \
  --output utcs/EASA-53-10-SUB-2025-001.yaml

# Query UTCS database
python evidence-engine/utcs-query/query-utcs.py \
  --utcs-id "UTCS-MI:DEL:EASA:53-10:SUB:2025:001:v1" \
  --format json

# Verify evidence chain
python evidence-engine/utcs-validator/verify-chain.py \
  --start "UTCS-MI:CAE:AAA:FEM:53-10:STATIC:R01" \
  --end "UTCS-MI:DEL:EASA:53-10:SUB:2025:001:v1"
```

## Required UTCS Records

One UTCS record must exist for:
- [ ] Each submission package in `../submissions/`
- [ ] Each major revision of a submission
- [ ] Each resubmission in response to EASA findings

## Lifecycle

1. **Creation** — Generated when submission package is prepared
2. **Review** — Internal validation and approval
3. **Submission** — Package submitted to EASA
4. **Update** — Status updated as EASA reviews
5. **Acceptance** — Final status when EASA accepts
6. **Archival** — Permanent record preservation

## Status Values

- `draft` — In preparation
- `in_internal_review` — Under internal review
- `approved_for_submission` — Ready to submit
- `submitted_to_easa` — Submitted to authority
- `under_easa_review` — EASA reviewing
- `findings_received` — EASA issued findings
- `resubmitted` — Updated submission
- `accepted` — EASA accepted
- `archived` — Final archival

## KPIs

Track via CI/CD pipeline:
- UTCS coverage: % of submissions with UTCS records (target 100%)
- Validation pass rate: % passing CI checks (target 100%)
- Evidence chain completeness: % with full traceability (target 100%)
- Hash consistency: % with valid hashes (target 100%)

## Status

📋 **Ready for UTCS records**

---

**Related**:
- [Parent Directory](../) — EASA Submissions overview
- [Submissions](../submissions/) — Final packages
- [MoC Cross-Reference](../moc-cross-reference/) — Requirement mapping
- Domain UTCS Documentation: `../../../../../../../AAA-AIRFRAMES-AERODYNAMICS-AIRWORTHINESS/PLM/CAD/ASSY/assembly-sequences/utcs/`
