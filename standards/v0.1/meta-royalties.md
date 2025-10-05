# Meta‑Royalties (Infra & Tooling) · v0.1

**Objetivo.** Remunerar automáticamente a quienes crean las herramientas y estándares
que hacen posible la producción de artefactos (esquemas, workflows, generadores, validadores,
asistentes), sin cambiar el reparto a autores y validadores.

## Pool Meta
- Se define un pool `infra_bps_of_fee` dentro de la fee total (BPS sobre la fee).
- Este pool se distribuye entre los meta‑assets **referenciados** por el artefacto:
  - `tooling.used[] = [{ id, version, weight, payoutHint? }]`
  - Cuantos más meta‑assets y mayor `weight`, mayor porción relativa.

## Cómo se decide el pago
1) **Detección**: el CI lee `artifact.json` y recoge `tooling.used`.
2) **Resolución**: usa `standards/v0.1/meta-assets.registry.json` (o `payoutHint`) para
   resolver la cuenta de pago.
3) **Proporción**: suma de `weight` → distribución proporcional del pool meta.

## Asistentes AI
- Se registran como `agent:<nombre>` con `payoutHint`:
  - `tt: "sink:ai-compute"` (fondo de cómputo del repo) o
  - `tt: "creator/<operador-humano>"` si se quiere retribuir a la persona operadora.
- El agente se **reconoce** y se **reporta** (transparencia), el pago va a la cuenta designada.

## Invariantes
- No se rompe la suma de fee: `creators + validators + treasury + infra == 100% de la fee`.
- Si `infra_bps_of_fee=0`, el sistema queda como antes (compatibilidad total).
