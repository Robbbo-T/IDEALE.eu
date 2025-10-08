# Inputs
UTCS: `UTCS-MI:AAA:CAS:55:INPUT:{...}:rev[X]`

This directory contains input data and triggers for the CAS process for ATA 55 (Stabilizers).

## Purpose

Capture incoming requests, UE (Unique Element) hooks, AOG (Aircraft on Ground) events, and other triggers that initiate CAS workflows.

## Contents

Typical artifacts include:
- UE hooks and triggers
- AOG event notifications
- Fleet incident reports
- Service request forms
- Maintenance triggers
- Raw fleet data feeds

## Naming Convention

Files should follow the format:
```
INPUT-55-[TYPE]-[ID]-[DATE].[ext]
```

Example: `INPUT-55-AOG-12345-2025-01-27.json`

---

**Related**: [CAS Process](../README.md)
