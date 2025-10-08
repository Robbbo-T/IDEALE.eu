# Schedules
UTCS: `UTCS-MI:AAA:CAS:55:WORK:SCHEDULE:{...}:rev[X]`

This directory contains maintenance schedules for ATA 55 (Stabilizers).

## Purpose

Store maintenance planning schedules, including intervals, forecasts, and execution plans.

## Contents

Typical artifacts include:
- Scheduled maintenance intervals
- Maintenance planning documents (MPD)
- A-check, B-check, C-check schedules
- D-check planning
- Life-limited parts tracking
- Forecast schedules
- Execution schedules

## Naming Convention

Files should follow the format:
```
SCHEDULE-55-[TYPE]-[PERIOD]-[VERSION].[ext]
```

Example: `SCHEDULE-55-A-CHECK-2025-Q1-v1.xlsx`

## UTCS Example

`UTCS-MI:AAA:CAS:55:OUT:AMM:SCHED:A-CHECK:rev[A]`

---

**Related**: [Work Directory](../README.md) | [CAS Process](../../README.md)
