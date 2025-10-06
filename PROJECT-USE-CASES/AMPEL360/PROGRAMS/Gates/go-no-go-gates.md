# AMPEL360 Go/No-Go Decision Gates

**Version:** 2.0  
**Last Updated:** 2025-01-20  
**Status:** Active Framework

## Overview

This document defines the critical decision gates for the AMPEL360 program, establishing clear criteria for GO/PIVOT/NO-GO decisions at key program milestones. These gates ensure systematic risk management and enable informed investment decisions.

## Gate Structure

Each gate includes:
- **Technical Criteria**: TRL achievements, test completions
- **Regulatory Criteria**: Certification pathway milestones
- **Commercial Criteria**: Customer commitments, market validation
- **Financial Criteria**: Funding security, cost performance
- **Decision Options**: GO, PIVOT, EXTEND, CONSOLIDATE, NO-GO

## Gate 1: Technology Readiness Gate (2026 Q4)

### Gate Objective
Validate that critical technologies have matured sufficiently to justify Phase 2 development investment.

### Entry Criteria
- Technology maturation programs active for 18+ months
- €1.5B Phase 1 investment executed
- Demonstrator programs underway

### Technical Criteria (Weight: 40%)

```yaml
minimum_requirements:
  liquid_h2_storage:
    trl_achieved: "≥6"
    evidence:
      - Full-scale tank prototype (20,000L)
      - Performance test data (1000+ hours)
      - Crash test completion
    status: "PASS/FAIL"
    weight: 10%
  
  fuel_cells_25mw:
    trl_achieved: "≥6"
    scale_demonstrated: "≥5MW continuous"
    evidence:
      - 5MW system prototype
      - Altitude chamber testing complete
      - 1000+ hour endurance
    status: "PASS/FAIL"
    weight: 10%
  
  bwb_demonstrator:
    flight_hours: "≥50"
    evidence:
      - Flight test database
      - Aerodynamic model correlation
      - Control law validation
    status: "PASS/FAIL"
    weight: 8%
  
  cryogenic_distribution:
    trl_achieved: "≥6"
    evidence:
      - Piping system prototype
      - Thermal performance validation
      - Safety system qualification
    status: "PASS/FAIL"
    weight: 7%
  
  distributed_propulsion:
    trl_achieved: "≥6"
    evidence:
      - 2MW motor demonstration
      - EMI/EMC testing complete
    status: "PASS/FAIL"
    weight: 5%

scoring:
  pass_threshold: "≥35/40 points"
  critical_items: "H2 storage and fuel cells MUST pass"
```

### Regulatory Criteria (Weight: 20%)

```yaml
minimum_requirements:
  easa_engagement:
    requirement: "Special Condition drafts submitted"
    evidence:
      - SC-H2-01 draft submitted
      - SC-BWB-01 conceptual discussion initiated
      - EASA Issue Paper response delivered
    status: "PASS/FAIL"
    weight: 10%
  
  safety_case:
    requirement: "Preliminary safety case approved"
    evidence:
      - System Safety Assessment (preliminary)
      - Hazard analysis (preliminary)
      - Safety review board endorsement
    status: "PASS/FAIL"
    weight: 10%

scoring:
  pass_threshold: "≥18/20 points"
```

### Commercial Criteria (Weight: 20%)

```yaml
minimum_requirements:
  launch_customers:
    requirement: "≥2 Letters of Intent (LOI)"
    target_aircraft: "≥10 aircraft committed"
    evidence:
      - Signed LOIs from Tier 1 airlines
      - Route analysis completed
      - Economic modeling validated
    status: "PASS/FAIL"
    weight: 10%
  
  infrastructure_commitment:
    requirement: "Infrastructure consortium operational"
    evidence:
      - Consortium EEIG established
      - Frankfurt facility design approved
      - Partner funding committed
    status: "PASS/FAIL"
    weight: 10%

scoring:
  pass_threshold: "≥16/20 points"
```

### Financial Criteria (Weight: 20%)

```yaml
minimum_requirements:
  phase_2_funding:
    requirement: "€2B Phase 2 funding committed"
    breakdown:
      clean_aviation_ju: "≥€500M confirmed"
      industry_partners: "≥€800M committed"
      other_sources: "≥€700M pipeline"
    evidence:
      - Funding commitment letters
      - Grant award letters
      - Board approvals
    status: "PASS/FAIL"
    weight: 15%
  
  phase_1_cost_performance:
    requirement: "Phase 1 cost variance <20%"
    evidence:
      - Financial reports
      - Variance analysis
      - Corrective actions (if needed)
    status: "PASS/FAIL"
    weight: 5%

scoring:
  pass_threshold: "≥16/20 points"
```

### Decision Matrix

```yaml
decision_logic:
  go:
    criteria:
      - Total score ≥85/100
      - ALL critical items PASS
      - NO category below pass threshold
    action:
      - Proceed to Phase 2 (€4.5B investment)
      - Begin cargo variant development
      - Accelerate infrastructure deployment
  
  pivot_cargo_focus:
    criteria:
      - Total score 75-84
      - H2 storage & fuel cells PASS
      - Commercial/regulatory below threshold
    action:
      - Focus on cargo variant only
      - Delay passenger certification
      - Reduce near-term investment to €3B
      - Reassess passenger at Gate 2
  
  extend:
    criteria:
      - Total score 65-74
      - Technical criteria promising but incomplete
      - Regulatory pathway unclear
    action:
      - 12-month extension
      - Additional €200M investment
      - Focused risk mitigation
      - Re-gate in 2027 Q4
  
  no_go:
    criteria:
      - Total score <65
      - Critical item failures
      - Insurmountable technical/regulatory barriers
    action:
      - Program suspension
      - Asset preservation
      - Technology IP retention
      - Reassess in 2028
```

### Gate 1 Review Process

```yaml
review_timeline:
  t_minus_6_months:
    - Preliminary scoring
    - Risk mitigation planning
    - Stakeholder communication
  
  t_minus_3_months:
    - Evidence package compilation
    - Independent technical review
    - Financial audit
  
  t_minus_1_month:
    - Gate review board briefing
    - Decision recommendation preparation
    - Board materials distribution
  
  gate_meeting:
    duration: "2 days"
    participants:
      - Program Steering Committee
      - Technical Committee
      - Financial Committee
      - External reviewers (EASA, Clean Aviation JU)
    
    agenda:
      day_1:
        - Technical criteria review
        - Regulatory status update
        - Commercial progress
        - Financial position
      day_2:
        - Risk assessment
        - Decision options analysis
        - Board deliberation
        - Decision announcement

decision_authority:
  - AMPEL360 Board of Directors
  - Requires 2/3 majority
  - Clean Aviation JU observer (veto on safety)
```

---

## Gate 2: System Integration Gate (2028 Q4)

### Gate Objective
Confirm system-level integration readiness and market viability before committing to certification and production.

### Entry Criteria
- Phase 2 development active for 18+ months
- €3B+ invested to date
- Cargo variant in advanced development

### Technical Criteria (Weight: 40%)

```yaml
minimum_requirements:
  bwb_demonstrator_maturity:
    requirement: "≥200 flight hours"
    evidence:
      - Comprehensive flight test data
      - Model correlation complete
      - Control law validated
    weight: 8%
  
  h2_propulsion_flight_qualified:
    requirement: "Flight tested on demonstrator"
    evidence:
      - 50+ hours H2 propulsion flight time
      - All systems functional
      - No critical failures
    weight: 10%
  
  fuel_cells_full_scale:
    requirement: "25MW demonstrated (ground)"
    evidence:
      - Full nacelle system tested
      - Reliability demonstrated (2000+ hours)
      - Certification test plan approved
    weight: 10%
  
  space_t_uncrewed_success:
    requirement: "≥2 successful orbital missions"
    evidence:
      - Mission telemetry
      - Docking demonstrations
      - Systems performance validation
    weight: 7%
  
  cargo_variant_readiness:
    requirement: "Detailed design complete"
    evidence:
      - CDR (Critical Design Review) passed
      - Manufacturing plan approved
      - Supplier contracts in place
    weight: 5%

scoring:
  pass_threshold: "≥35/40 points"
```

### Regulatory Criteria (Weight: 25%)

```yaml
minimum_requirements:
  certification_basis_agreed:
    requirement: "EASA certification basis for cargo variant"
    evidence:
      - Special Conditions finalized
      - Type Certification Basis (TCB) approved
      - Certification test plan accepted
    weight: 15%
  
  infrastructure_approvals:
    requirement: "Frankfurt facility operational approval"
    evidence:
      - Operating license granted
      - Safety case approved
      - First refueling completed
    weight: 10%

scoring:
  pass_threshold: "≥20/25 points"
```

### Commercial Criteria (Weight: 20%)

```yaml
minimum_requirements:
  firm_orders:
    requirement: "≥5 aircraft firm orders"
    evidence:
      - Purchase agreements signed
      - Deposits received
      - Delivery slots confirmed
    weight: 12%
  
  infrastructure_network:
    requirement: "≥3 airports committed"
    evidence:
      - Frankfurt operational
      - Amsterdam, Copenhagen under construction
      - Consortium funding in place
    weight: 8%

scoring:
  pass_threshold: "≥16/20 points"
```

### Financial Criteria (Weight: 15%)

```yaml
minimum_requirements:
  phase_3_funding:
    requirement: "€4B Phase 3 funding pathway"
    evidence:
      - Customer advances (≥€1B)
      - Capital market access (≥€2B)
      - Strategic partner commitments (≥€1B)
    weight: 10%
  
  cost_performance:
    requirement: "Program cost variance <15%"
    evidence:
      - EVM (Earned Value Management) reports
      - Variance analysis
      - Recovery plans (if needed)
    weight: 5%

scoring:
  pass_threshold: "≥12/15 points"
```

### Decision Matrix

```yaml
decision_logic:
  go:
    criteria:
      - Total score ≥85/100
      - Cargo certification on track
      - Market demand validated
    action:
      - Full commitment to cargo certification
      - Passenger variant development authorized
      - Infrastructure network expansion
      - €8B Phase 3 investment approved
  
  extend_18_months:
    criteria:
      - Total score 75-84
      - Technical readiness good but delayed
      - Market softness or infrastructure delays
    action:
      - Timeline extension to 2030 Q2 cargo cert
      - Additional risk mitigation (€300M)
      - Maintain passenger variant optionality
      - Renegotiate customer contracts
  
  pivot_space_focus:
    criteria:
      - Score 70-80 with aircraft challenges
      - Space-T exceeding expectations
      - H2 infrastructure delays
    action:
      - Accelerate Space-T program
      - Defer aircraft to 2032+
      - Maintain technology programs
      - Reduce aircraft investment to €1B
  
  consolidate:
    criteria:
      - Resources constrained
      - One program significantly stronger
    action:
      - Focus on highest-probability program
      - Place other on hold
      - Preserve option value
```

---

## Gate 3: Market Entry Gate (2030 Q4)

### Gate Objective
Validate operational readiness and market entry success before full production ramp.

### Entry Criteria
- Cargo variant in flight test
- Space-T crewed demonstrations complete
- €10B+ invested to date

### Technical Criteria (Weight: 35%)

```yaml
minimum_requirements:
  cargo_certification:
    requirement: "Type Certificate issued or imminent"
    evidence:
      - Certification test campaign complete
      - TCDS (Type Cert Data Sheet) published
      - Production Certificate application
    weight: 15%
  
  space_t_crew_success:
    requirement: "≥1 successful crewed mission"
    evidence:
      - Crew mission completed
      - All systems nominal
      - Crew feedback positive
    weight: 10%
  
  passenger_variant_progress:
    requirement: "50-pax variant in flight test"
    evidence:
      - First flight completed
      - Envelope expansion underway
      - Certification plan on track
    weight: 10%

scoring:
  pass_threshold: "≥30/35 points"
```

### Commercial Criteria (Weight: 30%)

```yaml
minimum_requirements:
  order_book:
    requirement: "≥10 aircraft firm orders"
    value: "≥€2.5B"
    evidence:
      - Purchase agreements
      - Payment schedules
      - Delivery schedule
    weight: 15%
  
  infrastructure_operational:
    requirement: "≥3 airports fully operational"
    capacity: "≥20 tonnes/day H2 capacity"
    evidence:
      - Operating statistics
      - Refueling operations completed
      - Safety record
    weight: 10%
  
  space_t_bookings:
    requirement: "≥20 passenger seats booked"
    evidence:
      - Customer contracts
      - Deposits received
      - Mission planning
    weight: 5%

scoring:
  pass_threshold: "≥24/30 points"
```

### Operational Criteria (Weight: 20%)

```yaml
minimum_requirements:
  production_capability:
    requirement: "2 aircraft/month rate capability"
    evidence:
      - Factory acceptance tests
      - Supplier delivery performance >95%
      - Quality metrics meeting targets
    weight: 10%
  
  operational_procedures:
    requirement: "Pilot training, maintenance programs certified"
    evidence:
      - Training center operational
      - 20+ pilots type-rated
      - Maintenance manuals approved
    weight: 10%

scoring:
  pass_threshold: "≥16/20 points"
```

### Financial Criteria (Weight: 15%)

```yaml
minimum_requirements:
  cash_flow_positive:
    requirement: "Cargo operations generating positive cash flow"
    evidence:
      - Financial statements
      - Revenue > direct operating costs
      - Contribution margin positive
    weight: 10%
  
  funding_secured:
    requirement: "Passenger variant funding secured"
    amount: "≥€3B"
    evidence:
      - Capital market access
      - Customer advances
      - Lender commitments
    weight: 5%

scoring:
  pass_threshold: "≥12/15 points"
```

### Decision Matrix

```yaml
decision_logic:
  go_full_production:
    criteria:
      - Total score ≥85/100
      - Cargo operations successful
      - Market demand strong
    action:
      - Ramp to 4 aircraft/month (2032)
      - Full passenger variant investment
      - Space-T commercial operations
      - Target profitability 2035
  
  optimize:
    criteria:
      - Total score 75-84
      - Operations good but refinement needed
    action:
      - Maintain 2 aircraft/month
      - Optimize before ramp
      - Adjust passenger timeline
      - Conservative financial planning
  
  consolidate_cargo:
    criteria:
      - Cargo strong, passenger uncertain
      - Score 70-80
    action:
      - Focus cargo market penetration
      - Defer passenger to 2034+
      - Build operational track record
      - Maintain development optionality
  
  focus_space:
    criteria:
      - Space-T exceeding expectations
      - Aircraft market challenges
    action:
      - Accelerate Space-T fleet
      - Maintain aircraft at low rate
      - Emphasize space tourism
```

---

## Inter-Gate Monitoring

### Continuous KPI Tracking

```yaml
monthly_metrics:
  technical:
    - TRL progression vs plan
    - Test completion rate
    - Technical risk burn-down
  
  schedule:
    - Milestone achievement rate
    - Critical path status
    - Float consumption
  
  cost:
    - Cost variance (CV)
    - Schedule variance (SV)
    - Estimate at completion (EAC)
  
  risk:
    - Risk exposure
    - Risk mitigation progress
    - New risk identification rate

quarterly_reviews:
  program_review_board:
    - Deep-dive risk assessment
    - Gate readiness projection
    - Corrective action planning
  
  stakeholder_updates:
    - Progress communications
    - Risk disclosure
    - Funding status
```

### Early Warning System

```yaml
red_flags:
  technical:
    - Critical technology >6 months delayed
    - Major technical failure
    - Certification pathway blocked
  
  commercial:
    - Launch customer withdrawal
    - Market conditions deteriorate
    - Competitor breakthrough
  
  financial:
    - Cost overrun >20%
    - Funding source withdrawal
    - Cash flow crisis
  
response_protocols:
  flag_raised:
    - Immediate escalation to Program Director
    - Root cause analysis (48 hours)
    - Recovery plan (1 week)
  
  critical_situation:
    - Emergency Board convening
    - External expert consultation
    - Stakeholder communication
```

---

## Governance

### Decision Authority

```yaml
gate_decisions:
  go_decision:
    authority: "Board of Directors"
    quorum: "2/3 members"
    voting: "Simple majority"
  
  pivot_extend:
    authority: "Board of Directors"
    consultation: "Program Steering Committee"
    approval: "2/3 majority"
  
  no_go:
    authority: "Board of Directors"
    approval: "3/4 supermajority"
    external_review: "Required (Clean Aviation JU)"

appeal_process:
  - Program Director may request reconsideration
  - Additional evidence presentation (30 days)
  - Independent review board assessment
  - Final decision by Board (binding)
```

### Documentation Requirements

Each gate requires:
- Evidence Package (compiled 90 days before)
- Independent Technical Review Report
- Financial Audit
- Risk Assessment Update
- Recommendation Memo (Program Director)
- Board Resolution

---

**Document Control:**
- **Version:** 2.0
- **Approval:** AMPEL360 Board of Directors
- **Next Review:** Annually or at each gate
