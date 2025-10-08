# MAP-IIS — Information Intelligence Systems Management

> **Part of**: ASI-T2-INTELLIGENCE | **Domain**: IIS  
> **Function**: Domain Orchestration Service  
> **Status**: Template · **UTCS-anchored**

---

## Overview

**MAP-IIS** orchestrates management and planning services for the **IIS (Information Intelligence Systems)** domain within ASI-T2-INTELLIGENCE.

### Purpose

- **Domain Coordination**: Orchestrate IIS domain activities across the TFA flow
- **Requirements Management**: Track information intelligence systems requirements and specifications
- **Resource Allocation**: Coordinate teams, tools, and facilities
- **Integration Management**: Coordinate interfaces with other domains

---

## Domain Scope

**IIS** covers:
Data systems, AI/ML, decision support

---

## Integration with TFA Flow

| TFA Stage | IIS Activities |
| :--- | :--- |
| **QS** | Explore design alternatives and configurations |
| **FWD** | Predict performance, reliability, and lifecycle |
| **UE** | Capture design snapshots and as-built configurations |
| **FE** | Coordinate with interfacing domains |
| **CB** | Validate against requirements and constraints |
| **QB** | Optimize performance and efficiency |

---

## PLM Integration

| CAx | IIS Application |
| :--- | :--- |
| **CAD** | Geometric design and modeling |
| **CAE** | Analysis and simulation |
| **CAO** | Requirements and optimization |
| **CAM** | Manufacturing planning |
| **CAI** | Interface coordination |
| **CAV** | Verification and validation |
| **CAS** | Operational support |
| **CMP** | Program management |

---

## UTCS Anchors

```
UTCS-MI:MAP:IIS:{activity}:{artifact}:rev[X]
```

**Example**:
```
UTCS-MI:MAP:IIS:DESIGN:BASELINE:rev[A]
```

---

## Related Services

- **[DOMAIN-IIS](../../DOMAINS/IIS-Information-Intelligence-Systems/)**— Domain knowledge repository
- **[MAL-SERVICES](../../MAL-SERVICES/)** — TFA computational services
- **Other MAP Services** — Cross-domain coordination

---

**Maintained by**: ASI-T2 Intelligence Team  
**Last Updated**: 2025-01-27  
**Version**: v0.2 (TFA-V2 Canon Aligned)
