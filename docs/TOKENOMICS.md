# Tokenomics Framework

## Overview

IDEALE.eu's tokenomics framework enables teams to participate, contribute, and earn through flexible participation models. The system tracks contributions, measures value, and distributes rewards fairly across different organizational structures.

## Core Principles

1. **Transparency**: All contributions and rewards are traceable
2. **Fairness**: Value is measured objectively across sectors
3. **Flexibility**: Multiple participation models for different needs
4. **Sustainability**: Long-term incentive alignment
5. **Governance**: Democratic or consensus-based decision making

## Participation Models

### 1. Team-Based Model

**Description**: Organizations with internal teams collaborating on artifacts

**Characteristics**:
- Clear organizational boundaries
- Internal governance structures
- Simplified reward distribution
- Organization-level reporting

**Ideal For**:
- Corporate R&D departments
- Government agencies
- Research institutions
- Defense contractors

**Setup Requirements**:
```json
{
  "model": "team-based",
  "organization": {
    "id": "org-uuid",
    "name": "Organization Name",
    "sector": "defense",
    "classification_level": "confidential"
  },
  "teams": [
    {
      "id": "team-uuid",
      "name": "Team Alpha",
      "members": ["member-uuids"],
      "governance": "hierarchical",
      "reward_policy": "merit-based"
    }
  ],
  "reward_distribution": {
    "method": "internal",
    "frequency": "monthly",
    "approval_required": true
  }
}
```

**Reward Flow**:
```
Individual Contribution → Team Pool → Team Lead Approval → Distribution
```

### 2. Cross-Organizational Model

**Description**: Multiple organizations collaborating on shared projects

**Characteristics**:
- Multi-stakeholder governance
- Transparent contribution tracking
- Shared IP management
- Inter-organizational settlement

**Ideal For**:
- Consortium projects
- Public-private partnerships
- Joint ventures
- Standards development

**Setup Requirements**:
```json
{
  "model": "cross-organizational",
  "collaboration": {
    "id": "collab-uuid",
    "name": "EU Energy Grid Initiative",
    "participants": [
      {
        "organization_id": "org-uuid-1",
        "role": "lead",
        "ownership_share": 0.4
      },
      {
        "organization_id": "org-uuid-2",
        "role": "contributor",
        "ownership_share": 0.3
      }
    ],
    "governance": {
      "type": "consensus",
      "voting_threshold": 0.67,
      "dispute_resolution": "mediation"
    }
  },
  "reward_distribution": {
    "method": "proportional",
    "frequency": "quarterly",
    "approval_mechanism": "multi-sig"
  }
}
```

**Reward Flow**:
```
Contribution → Shared Pool → Multi-Org Approval → Proportional Distribution
```

### 3. Ad-Hoc Cluster Model

**Description**: Dynamic project-based collaboration with flexible membership

**Characteristics**:
- Flexible team formation
- Task-based contributions
- Individual contributor focus
- Democratic governance

**Ideal For**:
- Open source projects
- Innovation challenges
- Hackathons
- Bounty programs

**Setup Requirements**:
```json
{
  "model": "ad-hoc-cluster",
  "cluster": {
    "id": "cluster-uuid",
    "name": "Satellite Navigation Security",
    "description": "Improving GNSS resilience",
    "sector": "aerospace",
    "governance": "meritocratic"
  },
  "membership": {
    "type": "open",
    "approval_required": false,
    "reputation_threshold": 100
  },
  "tasks": [
    {
      "id": "task-uuid",
      "title": "Implement jamming detection",
      "reward": 1000,
      "complexity": 2.5,
      "status": "available"
    }
  ],
  "reward_distribution": {
    "method": "task-based",
    "frequency": "on-completion",
    "approval_mechanism": "peer-review"
  }
}
```

**Reward Flow**:
```
Task Claim → Completion → Peer Review → Cluster Approval → Instant Claim
```

## Contribution Types and Values

### Base Values

| Contribution Type | Base Value | Description |
|------------------|-----------|-------------|
| Artifact Creation | 100 | New specification, design, or report |
| Artifact Update | 30 | Significant update to existing artifact |
| Code Contribution | 50-200 | Tool integration or automation |
| Review | 20 | Quality review of artifacts |
| Documentation | 40 | Guides, tutorials, examples |
| Template Creation | 80 | Generative design templates |
| Knowledge Transfer | 60 | Mentoring, training, workshops |

### Complexity Multipliers

**Simple (1.0x)**
- Basic documentation
- Simple format conversions
- Template usage
- Minor updates

**Moderate (1.5x)**
- Technical specifications
- Multi-tool integrations
- Complex diagrams
- Comprehensive reviews

**Complex (2.0x)**
- Advanced system designs
- Novel tool integrations
- AI model development
- Security architecture

**Expert (3.0x)**
- Breakthrough innovations
- Critical security fixes
- Major platform features
- Sector-defining standards

### Quality Scores

**Calculation Method**:
```
Quality Score = (Technical Accuracy × 0.4) + 
                (Format Compliance × 0.2) + 
                (Documentation Quality × 0.2) + 
                (Review Ratings × 0.2)
```

**Score Ranges**:
- 0.5x: Requires significant rework
- 0.8x: Meets minimum standards
- 1.0x: Standard quality
- 1.5x: High quality
- 2.0x: Exceptional quality

### Sector Multipliers

Strategic importance adjustments:

| Sector | Multiplier | Rationale |
|--------|-----------|-----------|
| Defense | 2.0x | Critical national security |
| Intelligence | 1.8x | High security requirements |
| Aerospace | 1.6x | Safety-critical systems |
| Energy | 1.5x | Infrastructure criticality |
| ESG | 1.3x | Regulatory importance |
| Logistics | 1.2x | Economic significance |

### Model Factors

| Model Type | Factor | Rationale |
|------------|--------|-----------|
| Team-Based | 1.0x | Baseline |
| Cross-Org | 1.2x | Coordination complexity |
| Ad-Hoc | 1.1x | Flexibility premium |

## Reward Calculation

### Formula
```
Total Reward = Base Value × Complexity × Quality × Sector Multiplier × Model Factor
```

### Examples

**Example 1: Team-Based Artifact**
```
Type: Technical Specification (Defense Sector)
Base Value: 100
Complexity: 2.0 (Complex)
Quality: 1.5 (High Quality)
Sector Multiplier: 2.0 (Defense)
Model Factor: 1.0 (Team-Based)

Total Reward = 100 × 2.0 × 1.5 × 2.0 × 1.0 = 600 tokens
```

**Example 2: Cross-Org Code Contribution**
```
Type: Tool Integration (Energy Sector)
Base Value: 150
Complexity: 2.5 (Expert)
Quality: 1.8 (Exceptional)
Sector Multiplier: 1.5 (Energy)
Model Factor: 1.2 (Cross-Org)

Total Reward = 150 × 2.5 × 1.8 × 1.5 × 1.2 = 1,215 tokens
```

**Example 3: Ad-Hoc Review**
```
Type: Artifact Review (Logistics Sector)
Base Value: 20
Complexity: 1.5 (Moderate)
Quality: 1.2 (Above Average)
Sector Multiplier: 1.2 (Logistics)
Model Factor: 1.1 (Ad-Hoc)

Total Reward = 20 × 1.5 × 1.2 × 1.2 × 1.1 = 48 tokens
```

## Reputation System

### Reputation Metrics

**Contribution Score**
- Number of accepted artifacts
- Total contribution value
- Consistency over time

**Quality Score**
- Average review ratings
- Revision requirements
- Compliance rate

**Collaboration Score**
- Cross-org participation
- Mentoring activities
- Community engagement

**Expertise Score**
- Sector-specific contributions
- Technical depth
- Innovation level

### Reputation Levels

| Level | Range | Benefits |
|-------|-------|----------|
| Newcomer | 0-100 | Basic participation |
| Contributor | 101-500 | Task claiming priority |
| Expert | 501-2000 | Review privileges |
| Master | 2001-5000 | Governance voting |
| Legend | 5000+ | Platform-level governance |

### Reputation Benefits

**Task Access**
- Higher reputation = access to more complex tasks
- Priority in ad-hoc cluster selection
- Fast-track review for trusted contributors

**Governance**
- Voting rights based on reputation
- Proposal submission privileges
- Dispute resolution participation

**Recognition**
- Public profile badges
- Sector-specific certifications
- Featured contributor status

## Distribution Mechanisms

### Team-Based Distribution

**Process**:
1. Individual contributions tracked
2. Team pool accumulates
3. Team lead reviews and approves
4. Distribution according to internal policy

**Policies**:
- Equal distribution
- Merit-based distribution
- Role-based distribution
- Hybrid approaches

### Cross-Org Distribution

**Process**:
1. Contributions tagged by organization
2. Shared pool accumulates
3. Multi-sig approval process
4. Proportional distribution to organizations
5. Each org distributes internally

**Governance**:
- Voting weight by contribution or agreement
- Threshold voting (e.g., 67%)
- Dispute escalation procedures

### Ad-Hoc Distribution

**Process**:
1. Task completion verified
2. Peer review conducted
3. Cluster voting or approval
4. Immediate reward claim
5. Reputation updated

**Thresholds**:
- Minimum reputation for claiming
- Review requirements by task complexity
- Anti-gaming measures

## Smart Contracts (Future)

### Contract Types

**Contribution Tracking**
```solidity
contract ContributionTracker {
    struct Contribution {
        address contributor;
        string artifactId;
        uint256 value;
        uint8 quality;
        uint256 timestamp;
    }
    
    mapping(address => Contribution[]) public contributions;
    
    function recordContribution(...) external;
    function calculateReward(...) public view returns (uint256);
}
```

**Reward Distribution**
```solidity
contract RewardDistributor {
    function distributeTeamRewards(...) external;
    function distributeCrossOrgRewards(...) external;
    function claimAdHocReward(...) external;
}
```

**Governance**
```solidity
contract Governance {
    function propose(...) external;
    function vote(...) external;
    function execute(...) external;
}
```

## Compliance and Taxation

### Tax Considerations
- Contributions may be taxable income
- Organizations responsible for local compliance
- Reporting interfaces for tax authorities
- Different treatment by jurisdiction

### Record Keeping
- All transactions logged
- Annual reports generated
- Audit trail maintained
- Export capabilities for accounting

## Anti-Gaming Measures

### Sybil Resistance
- Identity verification requirements
- Reputation thresholds
- Pattern detection algorithms
- Manual review for suspicious activity

### Quality Control
- Mandatory peer review
- Random audits
- Reputation penalties for poor quality
- Escalating review requirements

### Fair Distribution
- Contribution diversity requirements
- Geographic distribution tracking
- Organization size normalization
- Anti-concentration mechanisms

## Future Enhancements

### Planned Features
- Token liquidity (exchange integration)
- Staking mechanisms
- Delegated governance
- Cross-platform rewards
- NFT certifications

### Research Areas
- Dynamic reward algorithms
- AI-based quality assessment
- Predictive contribution valuation
- Automated dispute resolution

## Getting Started

See [CONTRIBUTING.md](./CONTRIBUTING.md) for detailed instructions on:
- Choosing your participation model
- Setting up contribution tracking
- Understanding reward calculation
- Claiming your rewards

---

*The tokenomics framework evolves based on community feedback and platform growth. Proposals for improvements are welcome through the governance process.*
