# CAD — 53-10 Center Body (AAA/ATA 53)

This package holds **geometry and assembly artifacts** for the Center Body (ATA 53-10), with UTCS anchors and TFA alignment.

## Scope
- **ASSY/** master assembly + DMU signals (CB→UE loop, FE orchestration)
- **PRT/** structural part geometry (STEP/AP242)
- **DRW/** lightweight drawing/definition stubs (link to CAV for evidence)
- **utcs/** CAD-level UTCS records anchoring baselines & provenance

## TFA
Primary loop for CAD/DMU evidence: **CB → UE** coordinated by **FE**.
QS holds baseline context; QB optional for path/sequence optimization.

## UTCS patterns
- Assembly: `UTCS-MI:CAD:AAA:ASSY:53-10:{code}:revX`
- Part: `UTCS-MI:CAD:AAA:PRT:53-10:{code}:revX`
- DMU: `UTCS-MI:ASM:DMU:CB:{idx}:vX`

See `./utcs/` for the canonical YAML.
