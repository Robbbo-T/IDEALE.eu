# Configuration Files

This directory contains configuration files for the IDEALE.eu ecosystem, including the **meta-royalties** settings.

## Files

### `royalties.json`

Core configuration for the creator royalty distribution and payout policy.

**Schema (fields):**

* `version` — configuration schema version (string)
* `fee_bps` — fee in basis points applied to **artifact value** (e.g., `10` = 0.1%)
* `distribution` — how the **fee** is split (BPS of the fee; must sum to `10000`)

  * `creators_bps_of_fee` — e.g., `6000` (60%)
  * `validators_bps_of_fee` — e.g., `2300` (23%)
  * `infra_bps_of_fee` — e.g., `1500` (15%) — Infra & Tooling / meta-assets
  * `treasury_bps_of_fee` — e.g., `200` (2%)
* `min_payout_threshold_tt` — minimum token/credit threshold for a payout cycle (integer)
* `payout_period_days` — accrual → payout cadence (integer days)

**Reference configuration:**

```json
{
  "version": "v0.1",
  "fee_bps": 10,
  "distribution": {
    "creators_bps_of_fee": 6000,
    "validators_bps_of_fee": 2300,
    "infra_bps_of_fee": 1500,
    "treasury_bps_of_fee": 200
  },
  "min_payout_threshold_tt": 100,
  "payout_period_days": 30
}
```

**Key principles:**

* The **fee** is computed from the artifact’s declared value; **distribution** splits the **fee**, not the value.
* `distribution` **must** sum to **10000 BPS (100%)**.
* Keep `fee_bps` ≤ **100** (≤ 1%) per baseline guidelines.

---

## Modifying Configuration

1. Edit `config/royalties.json`.
2. Ensure the distribution sums to 10000 and policy fields are sensible.
3. Validate locally:

   ```bash
   python3 - << 'PY'
   import json, sys
   cfg = json.load(open('config/royalties.json'))
   dist = cfg['distribution']
   total = sum([
     dist.get('creators_bps_of_fee',0),
     dist.get('validators_bps_of_fee',0),
     dist.get('infra_bps_of_fee',0),
     dist.get('treasury_bps_of_fee',0)
   ])
   assert total == 10000, f'Distribution must sum to 10000, got {total}'
   assert 0 <= cfg['fee_bps'] <= 100, f'fee_bps should be ≤ 100, got {cfg["fee_bps"]}'
   print('✓ royalties.json looks consistent')
   PY
   ```
4. Commit via the governance process (see below).

---

## Fee Calculation Example

Artifact declared value: **€50,000**

1. **Fee** = €50,000 × 0.001 (0.1%) = **€50**
2. **Distribution of the €50 fee**

   * Creators (60%): **€30.00**
   * Validators (23%): **€11.50**
   * Infra & Tooling (15%): **€7.50**
   * Treasury (2%): **€1.00**

---

## Backward Compatibility

To emulate *pre-meta-royalties* behavior (disable Infra share), reallocate and keep the sum at 10000:

```json
{
  "version": "v0.1",
  "fee_bps": 10,
  "distribution": {
    "creators_bps_of_fee": 6000,
    "validators_bps_of_fee": 3800,
    "infra_bps_of_fee": 0,
    "treasury_bps_of_fee": 200
  },
  "min_payout_threshold_tt": 100,
  "payout_period_days": 30
}
```

---

## Usage

Loaded automatically by:

* `scripts/accrue_royalty.py` — royalty calculation engine
* `.github/workflows/royalties-accrual.yml` — CI accrual workflow

---

## Governance

Changes to royalties policy **must** follow the process in [GOVERNANCE.md](../GOVERNANCE.md).

---

## See Also

* [README-ROYALTIES.md](../README-ROYALTIES.md) — Full system documentation
* [EXAMPLES-ROYALTIES.md](../EXAMPLES-ROYALTIES.md) — Usage examples
* [standards/v0.1/meta-royalties.md](../standards/v0.1/meta-royalties.md) — Policy details

---
