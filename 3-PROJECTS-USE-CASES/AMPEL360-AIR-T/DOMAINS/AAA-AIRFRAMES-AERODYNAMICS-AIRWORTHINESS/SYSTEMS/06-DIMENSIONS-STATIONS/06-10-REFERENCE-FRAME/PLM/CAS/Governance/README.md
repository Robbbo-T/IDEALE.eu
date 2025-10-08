# Governance

This directory contains quality, compliance, and process governance policies.

## Purpose

Governance ensures:
- **Quality** — Content meets standards
- **Compliance** — Regulatory requirements satisfied
- **Consistency** — Uniform practices across teams
- **Auditability** — Documented decision trail

## Structure

### policies/
Policy files defining requirements:

- **metadata.yaml** — Required metadata fields
- **security.yaml** — Security classification and export control
- **controlled-language.yaml** — ASD-STE100 configuration
- **acceptance.yaml** — Content acceptance criteria
- **publishing.yaml** — Publication approval workflow

### kpi/
Key Performance Indicators for CAS operations:
- Publication cycle time
- Defect rates
- Validation pass rates
- Content reuse metrics

## Policy Enforcement

Policies are enforced through:
- **CI/CD gates** — Automated validation
- **Review checklists** — Manual quality checks
- **Approval workflows** — Signature requirements
- **Audit trails** — Change tracking

## Metadata Policy

Defines required fields in `identAndStatusSection`:
- `responsiblePartnerCompany`
- `security` classification
- `issueInfo` with dates
- `qualityAssurance` approvals

## Security Policy

Defines requirements for:
- Export control classification (ITAR, EAR)
- Distribution restrictions
- Proprietary marking
- Encryption requirements

## Controlled Language Policy

ASD-STE100 Simplified Technical English:
- Approved vocabulary list
- Writing rules profile
- Verification method
- Exception approval process

## KPI Monitoring

Track CAS performance:
- **Quality KPIs** — Validation pass rate, rework rate
- **Schedule KPIs** — On-time delivery, cycle time
- **Productivity KPIs** — DMs authored, content reuse
- **Compliance KPIs** — Policy adherence, audit findings

## Related

- [./policies/](./policies/) — Detailed policy files
- [./kpi/](./kpi/) — KPI dashboards and reports
- [../CSDB/](../CSDB/) — Governed content
