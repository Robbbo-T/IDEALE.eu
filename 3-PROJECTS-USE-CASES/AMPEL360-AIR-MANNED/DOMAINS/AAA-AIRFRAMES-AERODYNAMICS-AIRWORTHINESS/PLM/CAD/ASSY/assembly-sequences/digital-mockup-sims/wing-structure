# DMU Simulations for WING STRUCTURE

This directory contains specialized Digital Mockup (DMU) simulations focused exclusively on the assembly and integration sequences of the **SA-AAA-WINGBOX-001** sub-assembly (ribs, spars, panels).

These simulations validate the internal assembly processes of the wing structure, distinct from the major join processes handled by the parent `digital-mockup-sims/` directory.

## Scope and Focus

1.  **Internal Component Integration:** Verification of spar/rib alignment and composite panel installation paths.
2.  **Tooling Validation:** Checking the reach and clearance of internal tooling required for the wing box.
3.  **Fastener Pattern Feasibility:** DMU validation of torque tool access across complex internal stiffeners.

## TFA Context and Traceability

DMU artifacts here primarily support the upstream **SA-AAA-WINGBOX-001** module (located in `../../sub-assemblies/wing-structure/`).

*   **TFA Flow:** Uses the canonical primary loop: **CB → UE** (Constraint Enforcement → Deterministic Snapshot).
*   **UTCS Anchors:** All files here must link back to the originating sub-assembly UTCS record: `UTCS-MI:SA:AAA:WINGBOX:0001:v1`.
*   **Artifact Naming:** Uses the standard `ASM-AAA-ONB-DMU-{IDX}.{ext}` pattern, reserving a specific index range (e.g., 5000-5999) for sub-assembly DMU.

## Directory Index (Hyperlinkable)

| Folder | Description |
| :--- | :--- |
| [Current Folder (`./`)](#) | DMU reports and animation files specific to internal wing structure build. |
| `utcs/` | Canonical UTCS YAML records for simulation outputs in this folder. |
| `thumbnails/` | Visual previews of complex internal assembly steps. |
| `rib-and-spar-mating/` | Simulations for aligning and joining major internal structural components. |
| `panel-installation-clearance/`| Checks verifying the clearance required for closing out the composite panels. |
| `internal-tool-reach/` | Studies validating access for internal drilling and fastening jigs. |

## Related Directories

- `../../../sub-assemblies/wing-structure/` : Canonical source for the SA-AAA-WINGBOX-001 models and ICDs.
- `../../../interference-analysis/` : Primary repository for clash rules used in these simulations.
- `../` : Contains DMU validation for *major section joins* (wing ↔ body).
