# Royalties Ledger

- Archivo: `royalties/ledger.jsonl` (JSON Lines)
- Tipos:
  - `ROYALTY_ACCRUE` (devengo por evento)
  - `ROYALTY_PAYOUT` (liquidación hacia cuentas de creadores)

**Ejemplo (1 línea por evento):**
```json
{"ts":"2025-10-04T12:00:00Z","type":"ROYALTY_ACCRUE","artifact_hash":"sha256:…","event":"reuse","declared_value_eur":10000,"fee_bps":10,"fee_eur":10,"split":{"creators_eur":6,"validators_eur":2.5,"treasury_eur":1.5},"allocations":[{"id":"did:github:alice","share_bps":7000,"amount_eur":4.2},{"id":"did:github:bob","share_bps":3000,"amount_eur":1.8}]}
```

## Structure

Each line in `ledger.jsonl` is a JSON object with the following fields:

### ROYALTY_ACCRUE
- `ts`: ISO 8601 timestamp
- `type`: "ROYALTY_ACCRUE"
- `artifact_hash`: Content hash of the artifact
- `event`: Type of event (anchor, reuse, verify, derivative)
- `declared_value_eur`: Declared value of the transaction
- `fee_bps`: Fee in basis points
- `fee_eur`: Calculated fee in EUR
- `split`: Distribution breakdown
  - `creators_eur`: Amount allocated to creators
  - `validators_eur`: Amount allocated to validators
  - `treasury_eur`: Amount allocated to treasury
- `allocations`: Array of individual creator allocations
  - `id`: Creator identifier
  - `share_bps`: Share in basis points
  - `amount_eur`: Calculated amount in EUR

### ROYALTY_PAYOUT
- `ts`: ISO 8601 timestamp
- `type`: "ROYALTY_PAYOUT"
- `creator_id`: Creator identifier
- `amount_eur`: Total amount paid
- `period_start`: Start of payout period
- `period_end`: End of payout period
- `transaction_id`: Payment transaction reference
