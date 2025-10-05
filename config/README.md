# Configuration Directory

This directory contains system-wide configuration files for the IDEALE.eu meta-royalties system.

## Files

### royalties.json

Core configuration for the royalty distribution system.

**Structure:**
```json
{
  "fee_bps": 10,              // Fee as basis points (10 = 0.1%)
  "distribution": {
    "creators_bps_of_fee": 6000,    // 60% to creators
    "validators_bps_of_fee": 2300,  // 23% to validators
    "infra_bps_of_fee": 1500,       // 15% to infrastructure
    "treasury_bps_of_fee": 200      // 2% to treasury
  }
}
```

**Key Principles:**
- All distribution values must sum to **10000 BPS (100%)**
- Fee is calculated as percentage of artifact's declared value
- Distribution percentages are applied to the fee, not the artifact value

## Modifying Configuration

To adjust the royalty distribution:

1. Edit `royalties.json`
2. Ensure distribution values sum to 10000
3. Validate with:
   ```bash
   python3 -c "
   import json
   cfg = json.load(open('config/royalties.json'))
   dist = cfg['distribution']
   total = sum([dist['creators_bps_of_fee'], dist['validators_bps_of_fee'], 
                dist['infra_bps_of_fee'], dist['treasury_bps_of_fee']])
   assert total == 10000, f'Distribution must sum to 10000, got {total}'
   print('✓ Valid configuration')
   "
   ```
4. Commit changes following governance procedures

## Fee Calculation Example

For an artifact with declared value of €50,000:

1. **Fee calculation:** €50,000 × 0.001 (0.1%) = €50
2. **Distribution:**
   - Creators: €50 × 60% = €30
   - Validators: €50 × 23% = €11.50
   - Infrastructure: €50 × 15% = €7.50
   - Treasury: €50 × 2% = €1.00

## Governance

Changes to this configuration should follow the governance process documented in [GOVERNANCE.md](../GOVERNANCE.md).

## Backward Compatibility

To disable infrastructure royalties (pre-meta-royalties behavior):
```json
{
  "fee_bps": 10,
  "distribution": {
    "creators_bps_of_fee": 6000,
    "validators_bps_of_fee": 3800,  // Increased from 2300
    "infra_bps_of_fee": 0,          // Disabled
    "treasury_bps_of_fee": 200
  }
}
```

## See Also

- [README-ROYALTIES.md](../README-ROYALTIES.md) — Full system documentation
- [standards/v0.1/meta-royalties.md](../standards/v0.1/meta-royalties.md) — Policy details
