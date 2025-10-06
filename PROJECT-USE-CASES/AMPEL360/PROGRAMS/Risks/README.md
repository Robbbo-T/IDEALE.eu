# AMPEL360 Risk Management

This directory contains the comprehensive risk tracking and management framework for the AMPEL360 program, covering both H2-BWB-Q100 (aircraft) and Space-T (spacecraft) development.

## Overview

The AMPEL360 risk management approach provides systematic identification, assessment, tracking, and mitigation of program risks across technical, regulatory, commercial, financial, and operational dimensions.

## Contents

### [risk-register.csv](./risk-register.csv)
**Comprehensive Risk Register**

Tracks 40+ program risks with detailed information:

**Risk Categories:**
- **Technical Risks** (15 risks): Technology maturation, integration, performance
- **Regulatory Risks** (8 risks): Certification pathways, approvals, compliance
- **Commercial Risks** (7 risks): Market demand, customer commitments, competition
- **Financial Risks** (6 risks): Funding, cost overruns, cash flow
- **Operational Risks** (4 risks): Infrastructure, supply chain, workforce

**Risk Attributes:**
- Risk ID and title
- Category and subcategory
- Probability (1-10 scale)
- Impact (1-10 scale)
- Risk Score (Probability × Impact)
- Current status
- Mitigation strategy
- Owner
- Target closure date

### bowties/
**Bowtie Risk Analysis Diagrams** (Placeholder)

Detailed cause-consequence analysis for critical risks using the bowtie methodology:
- **Left side**: Threats and preventive barriers
- **Center**: Critical event
- **Right side**: Consequences and recovery measures

*Note: Bowtie diagrams to be added in Phase 1 detailed risk analysis*

---

## Risk Management Framework

### Risk Assessment Scale

**Probability (1-10):**
- 1-2: Very Low (< 10% chance)
- 3-4: Low (10-30% chance)
- 5-6: Medium (30-50% chance)
- 7-8: High (50-70% chance)
- 9-10: Very High (> 70% chance)

**Impact (1-10):**
- 1-2: Negligible (< €10M, < 1 month delay)
- 3-4: Minor (€10-50M, 1-3 months delay)
- 5-6: Moderate (€50-200M, 3-6 months delay)
- 7-8: Major (€200-500M, 6-12 months delay)
- 9-10: Critical (> €500M, > 12 months delay, program threat)

**Risk Score = Probability × Impact**
- 1-25: Low risk (monitor)
- 26-50: Medium risk (active management)
- 51-75: High risk (executive attention)
- 76-100: Critical risk (immediate escalation)

### Risk Response Strategies

1. **Avoid**: Eliminate the risk by changing approach
2. **Mitigate**: Reduce probability or impact
3. **Transfer**: Shift risk to third party (insurance, contracts)
4. **Accept**: Acknowledge and monitor (with contingency)

### Risk Review Cadence

**Monthly**: Risk register updates, new risk identification
**Quarterly**: Deep-dive risk reviews with Program Review Board
**At Gates**: Comprehensive risk assessment for go/no-go decisions

---

## Top 10 Critical Risks

Based on current assessment, the highest priority risks are:

1. **BWB Structural Certification Complexity** (9/10 impact) - Major certification delays likely
2. **Human-Rating Certification Complexity** (9/10 impact) - Extensive testing requirements
3. **Liquid H2 Storage Integration** (8/10 impact) - Could delay program 18-24 months
4. **Hydrogen Infrastructure Development Lag** (8/10 impact) - Airport facility delays
5. **Fuel Cell Power Density Achievement** (8/10 impact) - 25MW target challenging
6. **Certification Pathway Uncertainty** (8/10 impact) - No BWB/H2 precedent
7. **Launch Customer Commitment Risk** (7/10 impact) - Early market adoption uncertain
8. **Supply Chain Concentration** (7/10 impact) - Critical component single-source
9. **Technology Integration Complexity** (7/10 impact) - Novel system interactions
10. **Regulatory Timeline Uncertainty** (7/10 impact) - Special Conditions development

## Risk Mitigation Highlights

**Key Mitigation Strategies:**
- **Phased Certification**: Demonstrator → Cargo → Passenger reduces risk
- **Infrastructure Consortium**: Multi-stakeholder approach addresses ecosystem gaps
- **Dual Sourcing**: Critical components have backup suppliers
- **Early Regulatory Engagement**: EASA/NASA coordination started in 2025 Q1
- **Technology Maturation Investment**: €11.3B focused on TRL progression
- **Decision Gates**: Clear go/no-go criteria with fallback options

## Risk Reporting

**Red Flags** (Immediate Escalation):
- Critical technology >6 months delayed
- Major technical failure
- Certification pathway blocked
- Launch customer withdrawal
- Cost overrun >20%
- Funding source withdrawal

**Response Protocol**:
1. Immediate escalation to Program Director
2. Root cause analysis (48 hours)
3. Recovery plan (1 week)
4. Emergency Board convening (if critical)

## Related Documentation

- [RFC-AMP-0001](../RFCs/RFC-AMP-0001-Program-Architecture-v2.md) - Risk analysis in program architecture
- [Decision Gates](../Gates/go-no-go-gates.md) - Risk criteria for gate decisions
- [Technology Roadmap](../Plans/tech-roadmap.md) - Technical risk mitigation plans
- [Certification Plan](../Plans/certification-plan.md) - Regulatory risk strategies

---

**Document Control:**
- **Version**: 2.0
- **Last Updated**: 2025-01-20
- **Status**: Active Risk Management
