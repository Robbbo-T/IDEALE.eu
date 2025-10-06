# Meta‑Royalties (Infra & Tooling) · v0.1

**Objective.** Automatically remunerate those who create the tools and standards
that make the production of artifacts possible (schemas, workflows, generators, validators,
assistants), without changing the distribution to authors and validators.

## Meta Pool
- A pool `infra_bps_of_fee` is defined within the total fee (BPS over the fee).
- This pool is distributed among the meta‑assets **referenced** by the artifact:
  - `tooling.used[] = [{ id, version, weight, payoutHint? }]`
  - The more meta‑assets and the higher the `weight`, the larger the relative share.

## How the payment is decided
1) **Detection**: the CI reads `artifact.json` and collects `tooling.used`.
2) **Resolution**: it uses `standards/v0.1/meta-assets.registry.json` (or `payoutHint`) to
   resolve the payment account.
3) **Proportion**: sum of `weight` → proportional distribution of the meta pool.

## AI Assistants
- They are registered as `agent:<name>` with `payoutHint`:
  - `tt: "sink:ai-compute"` (repo compute fund) or
  - `tt: "creator/<human-operator>"` if you want to reward the human operator.
- The agent is **recognized** and **reported** (transparency), the payment goes to the designated account.

## Invariants
- The sum of the fee is not broken: `creators + validators + treasury + infra == 100% of the fee`.
- If `infra_bps_of_fee=0`, the system remains as before (full compatibility).
