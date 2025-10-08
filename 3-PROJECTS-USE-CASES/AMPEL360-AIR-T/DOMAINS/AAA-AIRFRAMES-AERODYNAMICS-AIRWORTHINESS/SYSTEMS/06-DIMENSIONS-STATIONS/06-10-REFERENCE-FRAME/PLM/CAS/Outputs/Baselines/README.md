# Baselines

This directory contains immutable baseline snapshots of publications.

## Purpose

Baselines provide:
- **Configuration Management** — Frozen state of publication at specific point
- **Version Control** — Historical record of published content
- **Certification Support** — Immutable evidence for regulatory compliance
- **Rollback Capability** — Ability to restore previous versions
- **Audit Trail** — Complete provenance of published content

## Baseline Structure

Each baseline is a subdirectory with standardized format:
```
{YYYY-MM-DD}_{PUBLICATION}_{REVISION}/
├── README.md              ← Baseline documentation
├── pm/                    ← Publication Module files
├── dms/                   ← All referenced Data Modules
├── dmrl.xml               ← Data Module Requirements List
├── checksum/              ← SHA-256 integrity verification
│   └── checksums.txt
└── utcs-snapshot.json     ← UTCS provenance snapshot
```

## Naming Convention

```
{YYYY-MM-DD}_{TYPE}{ATA}-{SNS}_{REVISION}/
```

Examples:
- `2025-01-31_AMM06-10_REV-A/` — AMM for ATA 06-10, Revision A
- `2025-02-15_SRM06-10_REV-B/` — SRM for ATA 06-10, Revision B
- `2025-03-01_IPD06-10_REV-A/` — IPD for ATA 06-10, Revision A

Components:
- **Date** — Publication release date (YYYY-MM-DD)
- **Type** — AMM (Maintenance), SRM (Repair), IPD (Parts)
- **ATA-SNS** — ATA chapter and sub-system
- **Revision** — Publication revision letter

## Current Baselines

### 2025-01-31_AMM06-10_REV-A
Initial release of Aircraft Maintenance Manual for ATA 06-10 Reference Frame.

**Contents**:
- 1 Publication Module (structure)
- 5 Data Modules (descriptive, procedural, fault isolation, CIR, ACT)
- 1 DMRL
- UTCS snapshot with provenance
- Checksums for all files

**Status**: Immutable, released, current

## Baseline Creation Process

### 1. Preparation
- Validate all DMs (XSD, Schematron, BREX)
- Check DMRL completeness
- Verify PM references
- Run ACT applicability checks
- Validate ICN references

### 2. Assembly
```bash
# Create baseline directory
mkdir -p Outputs/Baselines/{DATE}_{PUB}_{REV}

# Copy Publication Modules
cp CSDB/PublicationModules/PM-*.xml Baselines/{DATE}_{PUB}_{REV}/pm/

# Copy referenced Data Modules
cp CSDB/DataModules/**/*.xml Baselines/{DATE}_{PUB}_{REV}/dms/

# Copy DMRL
cp CSDB/DMRL/dmrl.xml Baselines/{DATE}_{PUB}_{REV}/
```

### 3. Integrity Verification
```bash
# Calculate checksums
cd Baselines/{DATE}_{PUB}_{REV}
find . -type f -name "*.xml" | xargs sha256sum > checksum/checksums.txt
```

### 4. UTCS Snapshot
```bash
# Capture UTCS state
cp utcs/index.json Baselines/{DATE}_{PUB}_{REV}/utcs-snapshot.json

# Add provenance metadata
# - Created by, created date
# - Approved by, approval date
# - Validation status
# - CI pipeline ID
```

### 5. Documentation
Create baseline README with:
- Baseline information (date, publication, revision)
- Contents inventory
- Immutability statement
- Verification instructions
- Usage notes

### 6. Finalization
```bash
# Set read-only permissions
chmod -R a-w Baselines/{DATE}_{PUB}_{REV}

# Create git tag
git tag -a baseline-{DATE}-{PUB}-{REV} -m "Baseline for {PUB} {REV}"

# Commit baseline
git add Baselines/{DATE}_{PUB}_{REV}
git commit -m "Add baseline {DATE}_{PUB}_{REV}"
```

## Immutability

Baselines are **strictly immutable**:
- ❌ Never modify files in baseline
- ❌ Never delete baseline directories
- ❌ Never reuse baseline identifiers
- ✅ Create new baseline for changes
- ✅ Link new baseline to superseded baseline
- ✅ Maintain complete history

## Verification

Verify baseline integrity:
```bash
cd Baselines/{DATE}_{PUB}_{REV}

# Check all files
sha256sum -c checksum/checksums.txt

# Expected output: All files "OK"
```

If verification fails:
1. **Do not use** the baseline
2. Investigate cause of integrity failure
3. Recreate baseline from source
4. Report security incident if tampering suspected

## Baseline Relationships

Baselines can reference each other:
- **supersedes** — Previous baseline replaced
- **superseded_by** — Next baseline replacing this one
- **related** — Other relevant baselines

Document in baseline README and UTCS snapshot.

## Usage

### For Certification
- Submit baseline as evidence package
- Reference baseline in certification documents
- Provide checksums for verification
- Include UTCS snapshot for provenance

### For Configuration Management
- Use baseline as configuration item
- Reference in change documentation
- Track effectivity per baseline
- Manage serial number applicability

### For Rollback
1. Identify baseline to restore
2. Verify integrity with checksums
3. Extract DMs and PMs
4. Place in working CSDB
5. Validate and test
6. Create new baseline if republishing

### For Audit
- Review baseline contents
- Verify integrity via checksums
- Check UTCS provenance
- Validate against requirements
- Confirm approval chain

## Retention

Baselines must be retained:
- **Minimum**: Life of aircraft + 10 years
- **Certification**: Per regulatory requirements
- **Archive**: Transfer to long-term storage
- **Backup**: Multiple copies in secure locations

## Related

- [../PUBLISH/](../PUBLISH/) — Published output files
- [../../CSDB/](../../CSDB/) — Source content
- [../../CSDB/DMRL/](../../CSDB/DMRL/) — DMRL frozen in baselines
- [../../utcs/](../../utcs/) — UTCS index snapshot in baselines
- [../../Governance/](../../Governance/) — Baseline policies

## Best Practices

- **Automate Creation** — Use scripts for consistency
- **Validate Thoroughly** — Check before finalizing
- **Document Completely** — Include all metadata
- **Protect Integrity** — Read-only permissions
- **Verify Regularly** — Periodic checksum validation
- **Archive Securely** — Multiple backup locations
- **Link Versions** — Maintain supersession chain
