# MAL-CB — Classical Bit/Solver Service

> **Part of**: ASI-T2-INTELLIGENCE | **TFA Position**: 5a (QS → FWD → UE → FE → **CB** ↔ QB)  
> **Status**: Template · **UTCS-anchored**

---

## Overview

**MAL-CB** (Classical Bit/Solver) implements **constraint enforcement and validation** in the TFA canonical flow, providing deterministic solving and verification services.

### Purpose

CB represents **classical constraint-based solving** using established algorithms. In ASI-T2-INTELLIGENCE, MAL-CB services:

- **Enforce hard constraints** (physics laws, regulations, safety limits)
- **Validate solutions** against requirements and specifications
- **Provide deterministic guarantees** (proof of correctness)
- **Enable rapid constraint checking** for real-time systems

---

## Role in ASI-T2-INTELLIGENCE

| Function | Description |
| :--- | :--- |
| **Constraint Enforcement** | Validates designs against regulatory and physical limits |
| **Deterministic Solving** | Provides guaranteed solutions to constrained problems |
| **Real-Time Validation** | Fast constraint checking for operational systems |
| **Certification Support** | Generates compliance evidence and audit trails |

---

## TFA Flow Integration

```
    [MAL-QS]  ← Quantum Superposition State
        │
        ▼
    [MAL-FWD]  ← Forward Wave Dynamics
        │
        ▼
    [MAL-UE]  ← Unit/Unique Element
        │
        ▼
    [MAL-FE]  ← Federation Entanglement
        │
    ┌───┴───┐
    ▼       ▼
┌────────────────┐      ┌────────────────┐
│   MAL-CB       │ ←→   │   MAL-QB       │
│ Classical Bit  │      │ Qubit Inspired │
│ (Constraints)  │      │ (Optimization) │
└────────────────┘      └────────────────┘
```

CB and QB work in **tandem**:
- QB proposes optimized solutions
- CB validates against constraints
- Iterative refinement until feasible optimum found

---

## Service Capabilities

### 1. **Regulatory Constraint Enforcement**
- CS-25/FAR-25 airworthiness requirements
- ICAO LTAG emissions limits
- ReFuelEU Aviation mandates
- EU ETS compliance checking

### 2. **Physical Constraint Validation**
- Structural stress limits (yield, ultimate)
- Thermal limits (material temperature ranges)
- Aerodynamic constraints (stall margins, control authority)
- Propulsion constraints (thrust-to-weight, specific fuel consumption)

### 3. **Operational Constraint Checking**
- Flight envelope boundaries
- Performance guarantees (range, payload)
- Maintenance interval requirements
- Fleet availability targets

### 4. **Supply Chain Constraint Management**
- Lead time constraints
- Capacity constraints (manufacturing, MRO)
- Budget constraints (capital, operational)
- Inventory constraints (min/max levels)

---

## UTCS Anchors

All CB artifacts must include UTCS threading:

```yaml
utcs_anchor:
  context: "ASI-T2:MAL-CB:{domain}:{constraint_set}"
  content: "CB-VAL-{id}"
  cache: "CB-CACHE-{timestamp}"
  structure: "... → FE → CB ↔ QB"
  style: "constraint_enforcement"
  sheet: "MAL-CB-API-v2"
```

**Example**:
```
UTCS-MI:CB:AAA:CS25-305:WING-LOADS:rev[E]
```

---

## Integration with CAx Skills

MAL-CB interfaces with verification-intensive CAx competences:

| CAx Skill | CB Integration |
| :--- | :--- |
| **CAV** (Verification & Auditing) | **Primary user** — validates compliance against standards |
| **CAO** (Requirements Synthesis) | Checks requirement satisfaction and consistency |
| **CAE** (Predictive Modeling) | Validates simulation results against physical limits |
| **CAM** (Manufacturing Synthesis) | Checks manufacturing feasibility and DFM constraints |
| **CAI** (Interface Coordination) | Validates interface compatibility and budget closure |
| **CAS** (Operational Forecasting) | Checks operational constraints (slots, gates, fuel) |
| **CMP** (Strategic Governance) | Validates portfolio decisions against business constraints |
| **CAD** (Geometric Interpretation) | Checks geometric constraints (clearances, tolerances) |

---

## Solving Methods

CB implements multiple classical solvers:

| Solver | Use Case |
| :--- | :--- |
| **Linear Programming (LP)** | Linear objectives with linear constraints |
| **Mixed-Integer LP (MILP)** | Discrete decisions + continuous variables |
| **Constraint Satisfaction (CSP)** | Pure feasibility checking (no optimization) |
| **SAT/SMT Solvers** | Boolean satisfiability and symbolic reasoning |
| **Rule-Based Systems** | Regulatory compliance checking via inference |
| **Interval Arithmetic** | Worst-case bounds for safety-critical validation |

---

## Constraint Categories

### Hard Constraints (Must Satisfy)
- **Safety**: No single-point failures, minimum margins
- **Regulatory**: Certification basis requirements
- **Physics**: Conservation laws, material limits
- **Standards**: Industry standards (ISO, ASTM, AMS)

### Soft Constraints (Prefer to Satisfy)
- **Performance targets**: Range, speed, payload goals
- **Cost targets**: Development, production, operational
- **Schedule targets**: Milestones, delivery dates
- **Quality targets**: Reliability, maintainability

---

## Validation Outputs

CB generates structured validation reports:

```yaml
validation_report:
  status: "feasible" | "infeasible" | "conditionally_feasible"
  constraints_satisfied: 142
  constraints_violated: 3
  violations:
    - constraint: "CS-25.305(d)"
      severity: "critical"
      margin: -5.2%
      recommendation: "Increase spar cap thickness"
  utcs_anchor: "UTCS-MI:CB:AAA:CS25:rev[1]"
```

---

## Ethical Considerations (MAL-EEM)

All CB validations pass through **MAL-EEM** gates:

- **Ethics**: Constraint sets must not encode discriminatory rules
- **Empathy**: Human operators informed of constraint violations
- **Explainability**: Constraint logic must be interpretable
- **Mitigation**: Infeasible solutions trigger design iteration, not override

---

## API Reference

### Validate Against Constraints
```python
result = MAL_CB.validate(
    solution="QB-OPT-12345",
    constraintSets=["CS-25", "ICAO-LTAG"],
    strictness="regulatory",
    utcs_anchor="UTCS-MI:CB:AAA:VALIDATION:rev[1]"
)
```

### Check Single Constraint
```python
satisfied = MAL_CB.check_constraint(
    solution="UE-SNAP-67890",
    constraint="CS-25.305(d)",
    parameters={"load_factor": 2.5}
)
```

### Generate Compliance Matrix
```python
matrix = MAL_CB.compliance_matrix(
    design="UE-SNAP-67890",
    standard="CS-25",
    format="EASA_MoC"
)
```

### Iterate with QB
```python
# Typical CB-QB loop
for iteration in range(maxIterations):
    qbSolution = MAL_QB.optimize(objective, qbState)
    cbResult = MAL_CB.validate(qbSolution, constraints)
    if cbResult.status == "feasible":
        break
    else:
        qbState = MAL_QB.adjust(qbState, cbResult.violations)
```

---

## Related Services

- **[MAL-QB](../MAL-QB/README.md)** — Optimization partner (CB validates QB proposals)
- **[MAL-FE](../MAL-FE/README.md)** — Provides coordinated solutions to validate
- **[MAL-UE](../MAL-UE/README.md)** — Provides snapshots to check against constraints
- **[MAP-AAA](../../MAP-SERVICES/MAP-AAA/README.md)** — Airframe constraint validation
- **[MAP-PPP](../../MAP-SERVICES/MAP-PPP/README.md)** — Propulsion constraint validation

---

## Standards & Compliance

| Standard | Relevance |
| :--- | :--- |
| **CS-25/FAR-25** | Large aircraft airworthiness constraints |
| **DO-178C/DO-254** | Software/hardware certification constraints |
| **ISO 9001/AS9100** | Quality management constraints |
| **ISO 14001** | Environmental management constraints |
| **ICAO Annex 16** | Aircraft emissions and noise constraints |

---

## Development Status

🚧 **In Development** — Service template defined, implementation in progress

---

**Maintained by**: ASI-T2 Intelligence Team  
**Last Updated**: 2025-01-27  
**Version**: v0.2 (TFA-V2 Canon Aligned)
