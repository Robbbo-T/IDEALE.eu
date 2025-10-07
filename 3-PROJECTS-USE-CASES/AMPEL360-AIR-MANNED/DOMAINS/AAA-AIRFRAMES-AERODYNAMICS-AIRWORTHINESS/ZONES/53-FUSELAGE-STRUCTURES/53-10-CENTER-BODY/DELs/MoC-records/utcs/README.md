# UTCS Records for MoC

This directory contains UTCS (Universal Traceability and Certification System) YAML records for each Means of Compliance record.

## Purpose

UTCS records provide:
- **Immutable anchors** to MoC records and supporting evidence
- **Cryptographic hashing** for integrity verification
- **Provenance tracking** with approval chain
- **Traceability** to requirements, configuration, and evidence
- **Blockchain anchoring** for tamper-proof certification records

## Naming Convention

```
MOC-CS25-<PARA>-<METHOD>-<YYYY>-<SEQ>.yaml
```

Examples:
- `MOC-CS25-571-ANALYSIS-2025-001.yaml`
- `MOC-CS25-561-TEST-2025-002.yaml`
- `MOC-CS25-603-INSPECTION-2025-001.yaml`

## UTCS ID Format

Each UTCS record has a unique identifier:

```
UTCS-MI:MOC:CS25:<PARA>:<METHOD>:<YYYY>:<SEQ>:v<N>
```

Example:
```
UTCS-MI:MOC:CS25:571:ANALYSIS:2025:001:v1
```

## Required Fields

Each UTCS YAML must include:

```yaml
schema_version: "1.0"
utcs_id: "UTCS-MI:MOC:CS25:571:ANALYSIS:2025:001:v1"
product: "AMPEL360-AIR-T"
domain: "AAA"
zone: "53-FUSELAGE-STRUCTURES"
subzone: "53-10-CENTER-BODY"
bridge: "QS→FWD→UE→FE→CB→QB"
primary_path: "CB→CAV→UE"

requirement:
  cs_ref: "CS-25.571(a)"
  scope: "Description of requirement scope"

method: "Analysis"  # or Test, Inspection, Similarity, Service Experience

configuration:
  cad_assy: "UTCS-MI:CAD:AAA:ASSY:53-10:revC"
  fem_model: "UTCS-MI:CAE:AAA:FEM:53-10:FATIGUE:R02"
  materials: ["UTCS-MI:MAT:SPEC:CARBON:PREPREG:R05"]

evidence:
  record_file: "records/MOC-CS25-571-FATIGUE-DT-ANALYSIS-20250312-R01.pdf"
  attachments:
    - "methods/analysis/ANA-53-10-FATIGUE-R02.pdf"
    - "methods/test-results/TR-53-10-DT-01-R01.pdf"

integrity:
  hash_algorithm: "SHA256"
  content_hash:
    MOC-CS25-571-FATIGUE-DT-ANALYSIS-20250312-R01.pdf: "<sha256 hash>"

provenance:
  owner: "AAA Certification Team"
  analyst: "J. Smith"
  checker: "M. Rossi"
  design_authority: "Chief of Structures"
  created: "2025-03-12T10:20:00Z"

status: "approved"  # or draft, in_internal_review, in_easa_review
```

## Status Values

- `draft` — Work in progress, not released
- `in_internal_review` — Under internal technical review
- `approved` — Approved by design authority and QA
- `in_easa_review` — Submitted to EASA for review
- `easa_accepted` — Accepted by EASA
- `superseded` — Replaced by newer revision

## Integrity Verification

To verify UTCS record integrity:

```bash
# Calculate SHA256 hash of MoC record
sha256sum ../records/MOC-CS25-571-FATIGUE-DT-ANALYSIS-20250312-R01.pdf

# Compare to hash in UTCS YAML
grep "MOC-CS25-571" MOC-CS25-571-ANALYSIS-2025-001.yaml
```

## Blockchain Anchoring

Critical MoC records may be anchored to blockchain:

```yaml
blockchain_anchor:
  chain: "Ethereum"
  transaction_hash: "0xabc123..."
  block_number: 18234567
  anchor_date: "2025-03-15T08:30:00Z"
```

## Lifecycle

1. **Create** — Generate UTCS YAML when MoC record is released
2. **Validate** — CI/CD checks schema, hash, and references
3. **Anchor** — Optional blockchain anchoring for critical records
4. **Update** — New version if MoC record is revised
5. **Supersede** — Mark old version as superseded, link to new version

## CI/CD Validation

Automated checks verify:
- ✅ Schema conforms to UTCS v1.0
- ✅ UTCS ID is unique within repository
- ✅ Content hash matches actual file
- ✅ All referenced files exist
- ✅ Configuration UTCS anchors resolve
- ✅ Status is valid and consistent

## Related

- [../records/](../records/) — MoC records referenced in UTCS YAML
- [../methods/](../methods/) — Supporting evidence with UTCS anchors
- [../matrices/](../matrices/) — Compliance matrices with UTCS IDs
- [../../../../../../standards/](../../../../../../standards/) — UTCS schema documentation
