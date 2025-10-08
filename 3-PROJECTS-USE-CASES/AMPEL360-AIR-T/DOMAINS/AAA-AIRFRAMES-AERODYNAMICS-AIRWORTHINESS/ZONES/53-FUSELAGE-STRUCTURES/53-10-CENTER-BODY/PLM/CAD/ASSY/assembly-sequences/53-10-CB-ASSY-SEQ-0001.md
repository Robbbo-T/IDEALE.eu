# 53-10 Center Body — Assembly Sequence 0001

**UTCS**: UTCS-MI:AAA:CAD:ASSY:SEQ:53-10-CB-0001:rev[A] · **Owner**: MAP-AAA · **Status**: Production-Ready

## Purpose

Author the deterministic assembly route for 53-10 Center Body and emit CTQ/CAV gates, tooling, and UE emission criteria.

## Inputs

- **CAD ASSY**: `main-assembly.step`
- **Subassembly**: `SA:FRAME-SECTION-001`
- **DMU**: `ASM-AAA-ONB-DMU-0053` (clearance scan ≥ **8 mm**)

## Gates (CAV Hold Points)

- **H-1**: Datum alignment verified (S010)
- **H-2**: Torque rows 1–4 @ **12 N·m ±5%** (S030)
- **H-3**: Clearance scan pass (S040) → UE emit

## Precedence (DAG)

S010 → S020 → S030 → S040

## Steps

### S010 — Jig & Datum Alignment

- **Parts**: CB panel (PN: `CB-PANEL-A`, 1 ea)
- **Tools/Fixtures**: Jig `JIG-CB-03`, datum pins set `DP-53-10`, laser tracker `LT-07`
- **Process**: Clamp force **4.5 kN**; thermal delta ≤ **2 °C**
- **Checks (CTQ)**: Datum offset ≤ **0.20 mm** (MoC: `CAV-DATUM-CB-01`)
- **Safety/PPE**: Gloves, eye protection
- **Time**: 600 s

### S020 — Tack & Clamp (Sequence A)

- **Parts**: Temporary fasteners `CLECO-3/16` (qty 40)
- **Process**: Sequence A pattern; clamp spacing ≤ **150 mm**
- **Checks**: Visual—no gap > **0.5 mm**
- **Time**: 900 s

### S030 — Torque Rows 1–4

- **Spec**: **12 N·m ± 0.6 N·m**
- **Tools**: Powered torque wrench `TW-118` (cal **2025-01-10**), sockets set `SOC-6MM`
- **Checks (CTQ)**: Torque trace saved (MoC: `CAV-TORQUE-CB-12Nm`); fastener protrusion ≤ **0.4 mm**
- **Safety/PPE**: Gloves, hearing protection
- **Time**: 600 s

### S040 — Clearance Scan (DMU-0053)

- **Method**: Structured-light scan; compare to DMU envelope
- **Criterion (CTQ)**: **min_clearance ≥ 8.0 mm** (MoC: `ASM-AAA-ONB-DMU-0053`)
- **Output**: On pass → **UE snapshot** (UTCS-emit: `UTCS-MI:UE:AAA:MSN-XXXX:53-10-CB:SNAP:rev[A]`)
- **Time**: 300 s

## Interfaces

- **ASSY → CAM**: route ops/tooling (`cam.route.v1`)
- **ASSY → CAV**: H-1/H-2/H-3 checks (`cav.plan.v1`)
- **ASSY → CAS**: takt & station times (`cas.workorder.v1`)
- **ASSY → UE**: emit on H-3 pass

## KPIs (target)

- Takt time: **2400 s**
- CTQ pass rate ≥ **0.97**
- Rework ≤ **2%**
- Torque pass rate ≥ **0.99**

## Links

- DMU reference: `../digital-mockup-sims/ASM-AAA-ONB-DMU-0053.md`

## Provenance

generator: `assy-gen/1.4.0` · schema: `UTCS-MI:AAA:SCHEMA:ASSY-SEQUENCE:rev[A]`
