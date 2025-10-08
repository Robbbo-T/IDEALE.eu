# Exchange Packages

This directory manages data exchange with external systems and partners.

## Purpose

Exchange Packages facilitate formal data exchange using S1000D standards:
- Transmit content to OEMs, operators, MROs
- Receive updates from suppliers
- Maintain exchange audit trail
- Verify data integrity

## Structure

### incoming/
Packages received from external parties:
- Data Module updates from suppliers
- Illustration files from technical publications vendors
- Translation packages
- Configuration updates

### outgoing/
Packages sent to external parties:

- **transmittals/** — Formal transmittal documents
- **manifests/** — Package content manifests (JSON/XML)
- **checksums/** — SHA-256 integrity verification

## Exchange Package Structure

A typical outgoing package contains:
```
{RECIPIENT}_{YYYY-MM-DD}_{PACKAGE-ID}/
  ├─ manifest.json
  ├─ transmittal.pdf
  ├─ checksums.txt
  └─ content/
      ├─ DataModules/
      ├─ Illustrations/
      └─ PublicationModules/
```

## Manifest Format

Example manifest.json:
```json
{
  "packageId": "AMP360-AAA-06-10-001",
  "date": "2025-01-31",
  "sender": "AMPEL360 CAS Team",
  "recipient": "Operator XYZ",
  "contentType": "S1000D Issue 6.0",
  "files": [
    {
      "path": "DataModules/DMC-AMP360-AAA-06-10-00-00A-000A-A_en-001-00.xml",
      "checksum": "sha256:abc123..."
    }
  ],
  "utcs": "UTCS-MI:AAA:CAS:06-10:EXCHANGE:2025-01-31:rev[1]"
}
```

## Transmittal Documents

Formal transmittal includes:
- Package identifier
- Sender and recipient information
- List of contents
- Approval signatures
- Exchange purpose and instructions

## Checksum Verification

All exchanged files include SHA-256 checksums:
```
sha256sum content/DataModules/*.xml > checksums.txt
```

Recipients verify integrity:
```
sha256sum -c checksums.txt
```

## CI/CD Validation

Before package creation:
- ✅ All DMs validate against schemas
- ✅ Referenced files exist
- ✅ Manifest is complete and valid
- ✅ Checksums calculated correctly
- ✅ UTCS anchor created

## Related

- S1000D Issue 6.0, Chapter 5 (Data Management)
- [../CSDB/](../CSDB/) — Content source
- [../Governance/](../Governance/) — Exchange policies
