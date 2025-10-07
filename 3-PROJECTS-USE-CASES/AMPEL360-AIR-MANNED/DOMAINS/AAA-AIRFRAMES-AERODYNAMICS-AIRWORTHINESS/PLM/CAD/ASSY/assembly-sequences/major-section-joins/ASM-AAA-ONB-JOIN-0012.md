# Assembly Sequence — JOIN:0012 (Center Body ↔ Wing, Station 57-10)

## Metadata
- **Code**: ASM-AAA-ONB-JOIN-0012
- **Zone**: ONB
- **UTCS Anchor**: UTCS-MI:ASM:JOIN:ONB:0012:v1
- **Related DMU**: ../digital-mockup-sims/ASM-AAA-ONB-DMU-0012.md
- **CAD ASSY (gate)**: UTCS-MI:CAD:AAA:ASSY:57-10:revC
- **Fixture**: UTCS-MI:CAM:FIX:WING-JIG-02:v3

## Objective
Execute the center-body ↔ wing join ensuring clearance compliance, tool access feasibility, and torque schedule adherence.

## Dependencies (FE)
1. Tool access plan approved → `TOOL-ACCESS-ONB-JOIN-0012.md`
2. DMU result = clash-free → `../digital-mockup-sims/ASM-AAA-ONB-DMU-0012.md`
3. Fastener kit verified & staged → `FAST-ONB-JOIN-0012.csv`
4. QIP hold points configured → `QIP-ONB-JOIN-0012.md`

## Sequence Steps (CB→UE)
1. **Align** to WING-JIG-02 datums (D1/D2/D3).
2. **Pre-tack** 4 corner fasteners per pattern (see FAST csv).
3. **Torque Pattern A** rows 1–6 → torque/angle per spec.
4. **Verification**: clearance scan vs. spec (table below).
5. **Sign-off** QIP Hold H-57-JOIN-A; record in RESLOG.

## Clearance Summary (from DMU)
| Location     | Min Clearance | Spec | Status |
|:-------------|--------------:|-----:|:-----:|
| RIB5-STA160  | 8.4 mm        | 8.0 | ✅ |

## Approvals
- Assembly Eng: _Signed_
- DMU Analyst: _Signed_
- QA/QIP: _Signed_
