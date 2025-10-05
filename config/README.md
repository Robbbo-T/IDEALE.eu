# Configuration Files

This directory contains configuration files for the IDEALE.eu ecosystem.

## Files

### royalties.json

Configuration for the creator royalties system, including:

- **version**: Configuration schema version
- **fee_bps**: Transaction fee in basis points (10 bps = 0.1%)
- **distribution**: Fee distribution percentages
  - `creators_bps_of_fee`: Percentage allocated to creators (6000 = 60%)
  - `validators_bps_of_fee`: Percentage allocated to validators (2500 = 25%)
  - `treasury_bps_of_fee`: Percentage allocated to treasury (1500 = 15%)
- **min_payout_threshold_tt**: Minimum TT tokens required for payout
- **payout_period_days**: Days between payout periods

## Usage

The configuration is automatically loaded by:
- `scripts/accrue_royalty.py` - Royalty calculation engine
- `.github/workflows/royalties-accrual.yml` - CI workflow

## Modifying Configuration

1. Edit `royalties.json` with your desired values
2. Ensure distribution percentages sum to 10000 (100%)
3. Keep `fee_bps` ≤ 100 (1%) per standard guidelines
4. Validate changes before committing

## See Also

- [Creator Royalties Specification](../standards/v0.1/creator-royalties.md)
- [Quick Start Guide](../docs/ROYALTIES_QUICKSTART.md)
- [Implementation Summary](../docs/ROYALTIES_IMPLEMENTATION_SUMMARY.md)
