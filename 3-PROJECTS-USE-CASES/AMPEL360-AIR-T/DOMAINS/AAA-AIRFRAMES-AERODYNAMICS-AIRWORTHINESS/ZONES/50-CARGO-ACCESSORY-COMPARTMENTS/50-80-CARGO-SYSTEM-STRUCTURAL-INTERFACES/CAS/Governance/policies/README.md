# Governance Policies

This directory contains YAML policy files that define rules and requirements for the CAS system.

## Policy Files

### metadata.yaml
Defines required IDS (Identification and Status) fields for all Data Modules:
- Responsible partner company information
- Security classification requirements
- Issue and in-work numbering
- Quality assurance verification steps
- Export control markings
- Controlled language (ASD-STE100) enforcement

### acceptance.yaml
Specifies acceptance criteria for Data Modules before publication:
- XSD, Schematron, and BREX validation requirements
- Technical review and QA approval workflow
- Content completeness checks (STE, illustrations, references)
- Traceability requirements (UTCS anchors, requirement links)

### publishing.yaml
Defines publishing policies and baseline management:
- Baseline frequency and approval requirements
- Immutability and checksum policies
- Publication types (AMM, SRM, IPD) and distribution rules
- DMRL and UTCS snapshot requirements

### security.yaml
Establishes security classification and handling procedures:
- Classification levels (UNCLASSIFIED, INTERNAL, CONFIDENTIAL, PROPRIETARY)
- Export control markings (EAR99, EU-AL, ITAR-Exempt)
- Distribution and access control rules
- Encryption and watermarking requirements

### controlled-language.yaml
Enforces ASD Simplified Technical English (STE) compliance:
- STE standard version (Issue 8)
- Compliance target (95%)
- Allowed exceptions (technical terms, part numbers, proper nouns)
- Automated checker requirements
- Training and approval workflow

## Usage

These policy files are read by validation scripts and CI/CD workflows to enforce standards across all Data Modules in the CSDB.

## Related Documentation

- [Governance README](../README.md)
- [ASD-STE100 Specification](http://www.asd-ste100.org/)

