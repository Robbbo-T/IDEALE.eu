# Creator Royalties · v0.1

**Objetivo.** Remunerar automáticamente a creadores y coautores cada vez que un artefacto se **ancla, reutiliza, verifica o deriva**, con trazabilidad criptográfica.

## 1) Eventos remunerados
- `anchor`: primer anclaje verificable de un artefacto.
- `reuse`: uso por otra organización/equipo.
- `verify`: verificación/certificación premium.
- `derivative`: creación de derivado que declara herencia.

Cada evento indica `declared_value_eur` (o tarifa fija), se aplica una **fee** y se reparte según política.

## 2) Fórmula y reparto (por defecto)
- Fee base: `fee_bps = 10` (0,10%) sobre `declared_value_eur` (o tabla fija por evento).
- Distribución de la *fee*:
  - **60%** → **Pool de creadores** (según `revshare.allocations`)
  - **25%** → **Pool de validadores** (quienes firman/verifican)
  - **15%** → **Tesorería / Fundación** (mantenimiento estándar)

> Estos porcentajes son configurables en `config/royalties.json`.

## 3) Metadatos de autoría (schema)
Cada artefacto incluye:
```json
{
  "artifact": {
    "content_hash": "sha256:…",
    "declared_value_eur": 10000,
    "license": "IPR-CUSTOM|SPDX-ID",
    "revshare": {
      "total_bps": 10000,
      "allocations": [
        {"id": "did:github:alice", "role": "author", "share_bps": 7000, "payout": {"tt": "creator/alice", "iban": null}},
        {"id": "did:github:bob",   "role": "coauthor","share_bps": 3000, "payout": {"tt": "creator/bob",   "iban": null}}
      ],
      "derivative_policy": "accumulate_by_reference"
    }
  }
}
```

## 4) Ledger & CI

- **Ledger off‑chain (hoy):** `royalties/ledger.jsonl` con entradas `ROYALTY_ACCRUE` y `ROYALTY_PAYOUT`.
- **CI:** workflow detecta artefactos modificados, calcula devengos y publica comentario de reparto en el PR.
- **On‑chain (cuando toque):** uso de `RevenueSplit` para distribuir TT a `allocations`.

## 5) Cumplimiento

- Sin PII en-chain; solo hashes/IDs. Pagos EUR vía tesorería/KYC si se requiere.
- IVA y facturación: el sistema genera reportes por creador y periodo de liquidación.

## 6) Invariantes

- `sum(allocations.share_bps) == revshare.total_bps`
- `fee_bps <= 100` (≤1%) a nivel de estándar
- Todas las firmas (EIP-712) o hashes verificables en replay.
