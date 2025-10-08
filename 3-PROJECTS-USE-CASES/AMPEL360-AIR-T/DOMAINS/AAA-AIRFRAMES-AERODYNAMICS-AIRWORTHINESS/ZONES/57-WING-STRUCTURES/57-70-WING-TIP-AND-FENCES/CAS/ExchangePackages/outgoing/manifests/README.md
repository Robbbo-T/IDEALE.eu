# Exchange Package Manifests

This directory contains manifest files for outgoing S1000D data exchange packages.

## Purpose

Manifests provide a complete inventory of Data Modules, Publication Modules, and Illustrations included in an exchange package, along with checksums for integrity verification.

## Manifest Structure

Each manifest is a JSON file that includes:

```json
{
  "packageId": "XCHG-AMM-XX-YY-2025-10-08",
  "createdBy": "CAS-System",
  "createdDate": "2025-01-27T12:00:00Z",
  "packageType": "INCREMENTAL" | "FULL",
  "dms": [{
    "dmc": "DMC-...",
    "issue": "010",
    "inWork": "00",
    "title": "..."
  }],
  "pms": [{
    "pmCode": "PM-...",
    "issue": "01",
    "title": "..."
  }],
  "icns": [{
    "icn": "ICN-...",
    "format": "SVG"
  }],
  "hashes": [{
    "path": "pm/PM-...xml",
    "sha256": "..."
  }],
  "dmrl": {
    "included": true,
    "path": "dmrl.xml",
    "sha256": "..."
  }
}
```

## Package Types

- **INCREMENTAL** - Contains only changed/new Data Modules since last exchange
- **FULL** - Contains complete set of Data Modules for a publication

## Integrity Verification

All files in the exchange package include SHA-256 checksums in the manifest. Recipients can verify package integrity by:
1. Calculating checksums of received files
2. Comparing against manifest checksums
3. Rejecting packages with mismatched checksums

## Exchange Process

1. **Package Creation** - System generates manifest with all DMs, PMs, ICNs
2. **Checksum Calculation** - SHA-256 hashes computed for all files
3. **Manifest Generation** - JSON manifest file created
4. **Package Assembly** - Files and manifest packaged (ZIP/TAR)
5. **Transmission** - Package sent via agreed exchange protocol
6. **Verification** - Recipient validates checksums against manifest

## Related Documentation

- [Exchange Packages README](../../README.md)
- [CSDB README](../../../CSDB/README.md)
- [S1000D Exchange Specification](http://www.s1000d.org/)

