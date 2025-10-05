# IDEALE Evidence Engine - IP Defender

Protects intellectual property through clear ownership tracking and legal evidence generation.

## Features

### Ownership Registry
Tracks who owns what in collaborative artifacts:

- **Original creator** - Initial IP ownership
- **Contributors** - Modifications and additions
- **Licenses** - Usage rights and restrictions
- **Transfer history** - When IP changed hands

### Contribution Tracking
Records every contribution:

```json
{
  "contributor": "Organization Name",
  "contribution_type": "geometry|metadata|validation",
  "timestamp": "2024-01-15T10:30:00Z",
  "impact": "major|minor|patch",
  "ownership_percentage": 15.5
}
```

### Legal Export
Generates evidence packages for:

- **Patent applications** - Full provenance chain
- **IP disputes** - Court-admissible evidence
- **Licensing agreements** - Clear contribution records
- **Audit compliance** - Regulatory requirements

## Usage

```python
from ip_defender import OwnershipRegistry, LegalExport

# Track ownership
registry = OwnershipRegistry()
registry.register_creator("Airbus SE", artifact_id)
registry.register_contribution("Safran SA", artifact_id, impact="major")

# Generate legal evidence
evidence = LegalExport.generate(artifact_id)
evidence.save("legal-evidence-package.pdf")
```

## Legal Compliance

- **GDPR** - Data protection by design
- **eIDAS** - Electronic signatures
- **Patent cooperation treaty** - International filing
- **Trade secret protection** - Confidentiality measures
