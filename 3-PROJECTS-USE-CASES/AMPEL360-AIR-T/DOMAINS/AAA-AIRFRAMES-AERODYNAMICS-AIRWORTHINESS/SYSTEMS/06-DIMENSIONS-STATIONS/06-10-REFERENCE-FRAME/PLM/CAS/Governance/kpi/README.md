# Key Performance Indicators (KPIs)

This directory tracks quality, productivity, and compliance KPIs for CAS operations.

## Purpose

Monitor and improve:
- **Quality** — Content accuracy and validation pass rates
- **Productivity** — Authoring throughput and efficiency
- **Compliance** — Policy adherence and audit readiness
- **Timeliness** — Publication cycle time and on-time delivery

## KPI Categories

### Quality KPIs

- **Validation Pass Rate** — Percentage of DMs passing all validation gates first time
  - Target: >95%
  - Measured: XSD + Schematron + BREX pass rate

- **Rework Rate** — Percentage of DMs requiring revision after review
  - Target: <10%
  - Measured: DMs with status change from "new" to "revised"

- **Defect Density** — Number of errors per DM
  - Target: <2 errors/DM
  - Measured: Issues logged in review process

### Schedule KPIs

- **Cycle Time** — Days from DM creation to publication
  - Target: <14 days
  - Measured: Issue date to publish date

- **On-Time Delivery** — Percentage of publications released on schedule
  - Target: >90%
  - Measured: Actual vs planned release dates

### Productivity KPIs

- **DMs Authored per Week** — New DMs created
  - Target: TBD based on team size
  - Measured: New DMs by issue date

- **Content Reuse Rate** — Percentage of content from CIR
  - Target: >30%
  - Measured: CIR references / total content

- **Illustration Reuse** — ICNs used in multiple DMs
  - Target: >40%
  - Measured: ICN references across DMs

### Compliance KPIs

- **STE Compliance** — Percentage of text following ASD-STE100
  - Target: 100%
  - Measured: Automated STE checker results

- **Metadata Completeness** — DMs with all required IDS fields
  - Target: 100%
  - Measured: Metadata policy validation

- **BREX Compliance** — DMs passing BREX rules
  - Target: 100%
  - Measured: BREX validation results

- **ACT Coverage** — Applicability statements linked to ACT
  - Target: 100%
  - Measured: ACT reference validation

## Measurement

KPIs are measured:
- **Frequency**: Weekly for operational KPIs, monthly for strategic
- **Source**: Automated CI/CD pipeline logs and manual review logs
- **Reporting**: Dashboard updated daily, reports generated monthly

## Dashboards

KPI dashboards available at:
- Real-time: CI/CD pipeline metrics
- Weekly: Team performance dashboard
- Monthly: Management summary report

## Continuous Improvement

KPI trends drive:
- Process improvements
- Training needs identification
- Tool and automation investments
- Policy refinements

## Related

- [../policies/](../policies/) — Governance policies enforced by KPIs
- CI/CD pipeline — Source of automated KPI data
- Review checklists — Source of manual QA KPIs
