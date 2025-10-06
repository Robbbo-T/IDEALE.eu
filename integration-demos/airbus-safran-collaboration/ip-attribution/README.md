# IP Attribution

This directory contains IP ownership and contribution records for the Airbus-Safran collaboration demo.

## Purpose

Tracks intellectual property ownership and contributions to shared artifacts, ensuring:
- **Clear IP attribution** for each contribution
- **Legal protection** for both parties
- **Patent application support** with complete provenance
- **Dispute resolution** with court-admissible evidence
- **Licensing clarity** for derivative works

## Record Structure

IP attribution records follow the IDEALE IP Defender schema and track:
- Original creators and their contributions
- Modifications and their authors
- Ownership percentages
- License terms
- Transfer history

## Example Attribution Record

```json
{
  "artifact_id": "uuid-of-artifact",
  "artifact_name": "Wing Component - Propulsion Integration",
  "total_ownership": {
    "Airbus SE": {
      "percentage": 65.0,
      "contribution_type": "original_design",
      "contributions": [
        {
          "contribution_id": "contrib-001",
          "timestamp": "2024-01-10T09:00:00Z",
          "description": "Initial wing structural design",
          "impact": "major",
          "provenance_record": "record-uuid-001"
        }
      ]
    },
    "Safran SA": {
      "percentage": 35.0,
      "contribution_type": "modification",
      "contributions": [
        {
          "contribution_id": "contrib-002",
          "timestamp": "2024-01-15T10:30:00Z",
          "description": "Propulsion integration modifications",
          "impact": "major",
          "provenance_record": "record-uuid-003"
        }
      ]
    }
  },
  "license": {
    "type": "Collaborative",
    "terms": "Joint ownership with mutual licensing rights",
    "restrictions": ["No third-party transfer without consent"],
    "royalty_split": {
      "Airbus SE": 65.0,
      "Safran SA": 35.0
    }
  },
  "legal_status": {
    "patent_pending": false,
    "trade_secret": true,
    "confidentiality": "restricted"
  },
  "audit_trail": {
    "created": "2024-01-10T09:00:00Z",
    "last_updated": "2024-01-15T11:00:00Z",
    "verified_by": ["legal@airbus.com", "legal@safran.com"]
  }
}
```

## Contribution Tracking

Each contribution is tracked with:

```json
{
  "contributor": "Organization Name",
  "contribution_type": "geometry|metadata|validation|review",
  "timestamp": "2024-01-15T10:30:00Z",
  "impact": "major|minor|patch",
  "ownership_percentage": 15.5,
  "provenance_link": "uuid-of-provenance-record",
  "signature": {
    "algorithm": "Ed25519",
    "value": "...",
    "timestamp": "2024-01-15T10:30:05Z"
  }
}
```

## Impact Classification

- **Major** (>20% ownership) - Substantial new design or significant modifications
- **Minor** (5-20% ownership) - Improvements, optimizations, adaptations
- **Patch** (<5% ownership) - Bug fixes, documentation, metadata updates

## Files

- `ownership-registry.json` - Current ownership state for all artifacts
- `contribution-log.jsonl` - Chronological log of all contributions
- `legal-evidence/` - Evidence packages for patent applications and disputes

## Ownership Calculation

Ownership percentages are calculated based on:
1. **Contribution size** - Lines of code, geometry changes, etc.
2. **Contribution impact** - Major/minor/patch classification
3. **Complexity** - Difficulty and expertise required
4. **Novelty** - Originality and innovation level

## Usage

### Register original creator
```python
from ip_defender import OwnershipRegistry

registry = OwnershipRegistry()
registry.register_creator("Airbus SE", artifact_id)
```

### Register contribution
```python
registry.register_contribution(
    contributor="Safran SA",
    artifact_id=artifact_id,
    impact="major",
    percentage=35.0
)
```

### Generate legal evidence package
```python
from ip_defender import LegalExport

evidence = LegalExport.generate(artifact_id)
evidence.save("legal-evidence/wing-component-evidence.pdf")
```

## Legal Export Packages

Evidence packages include:
- **Patent applications** - Full provenance chain and contribution details
- **IP disputes** - Court-admissible evidence with blockchain anchors
- **Licensing agreements** - Clear contribution and royalty records
- **Audit compliance** - Regulatory requirements documentation

## Standards Compliance

- **GDPR** - Data protection by design
- **eIDAS** - Electronic signatures (EU regulation)
- **Patent Cooperation Treaty** - International filing support
- **Trade Secret Protection** - Confidentiality measures

## Security Features

✅ **Cryptographic signatures** on all records
✅ **Blockchain anchoring** for immutability
✅ **Complete provenance linkage** to verify contributions
✅ **Legal defensibility** with court-admissible evidence
✅ **GDPR compliance** for personal data

## Related Directories

- `../shared-artifacts/` - Artifacts with IP attributions
- `../provenance-log/` - Provenance records supporting IP claims

## Reference

- [IP Defender Documentation](../../../evidence-engine/ip-defender/README.md)
- [Legal compliance guidelines](../../../docs/legal-compliance.md)
