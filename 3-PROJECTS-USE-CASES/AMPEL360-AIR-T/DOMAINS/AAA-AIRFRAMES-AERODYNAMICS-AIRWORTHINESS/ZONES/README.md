# AAA Domain ZONES — AMPEL360-AIR-T

This directory organizes structural zones according to ATA chapter assignments.

**Path:** `3-PROJECTS-USE-CASES/AMPEL360-AIR-T/DOMAINS/AAA-AIRFRAMES-AERODYNAMICS-AIRWORTHINESS/ZONES/`

---

## Structure

Each zone is organized by ATA chapter number and contains sub-zones where the complete BEZ (Bloque de Estructura Base) is applied.

---

## Zones Defined

### [06-DIMENSIONS-STATIONS/](./06-DIMENSIONS-STATIONS/)

**ATA Chapter 06** — Dimensions and Stations

**Sub-zones**

* [06-10-REFERENCE-FRAME/](./06-DIMENSIONS-STATIONS/06-10-REFERENCE-FRAME/) — Aircraft reference frame and datum system ✓

---

### [14-HARDWARE/](./14-HARDWARE/)

**ATA Chapter 14** — Hardware

**Sub-zones**

* [14-10-HARDWARE-STANDARD-PRACTICES/](./14-HARDWARE/14-10-HARDWARE-STANDARD-PRACTICES/) — Hardware standard practices ✓
* [14-20-FASTENERS-GENERAL/](./14-HARDWARE/14-20-FASTENERS-GENERAL/) — General fasteners ✓
* [14-30-RIVETS-PINS/](./14-HARDWARE/14-30-RIVETS-PINS/) — Rivets and pins ✓
* [14-40-BOLTS-NUTS-WASHERS/](./14-HARDWARE/14-40-BOLTS-NUTS-WASHERS/) — Bolts, nuts, and washers ✓
* [14-50-INSERTS-BUSHINGS-ANCHORS/](./14-HARDWARE/14-50-INSERTS-BUSHINGS-ANCHORS/) — Inserts, bushings, and anchors ✓
* [14-60-CLAMPS-CLIPS-TIES/](./14-HARDWARE/14-60-CLAMPS-CLIPS-TIES/) — Clamps, clips, and ties ✓
* [14-70-SAFETY-WIRE-COTTER/](./14-HARDWARE/14-70-SAFETY-WIRE-COTTER/) — Safety wire and cotter pins ✓
* [14-80-ADHESIVES-SEALERS-HARDWARE/](./14-HARDWARE/14-80-ADHESIVES-SEALERS-HARDWARE/) — Adhesives, sealers, and hardware ✓
* [14-90-STANDARD-PARTS-CATALOG/](./14-HARDWARE/14-90-STANDARD-PARTS-CATALOG/) — Standard parts catalog ✓

---

### [50-CARGO-ACCESSORY-COMPARTMENTS/](./50-CARGO-ACCESSORY-COMPARTMENTS/)

**ATA Chapter 50** — Cargo and Accessory Compartments

**Sub-zones**

* [50-10-CARGO-HOLDS/](./50-CARGO-ACCESSORY-COMPARTMENTS/50-10-CARGO-HOLDS/) — Cargo and baggage compartment structures ✓

---

### [51-STANDARD-PRACTICES-STRUCTURES/](./51-STANDARD-PRACTICES-STRUCTURES/)

**ATA Chapter 51** — Standard Practices and Structures

**Sub-zones**

* [51-10-STRUCTURAL-STANDARDS/](./51-STANDARD-PRACTICES-STRUCTURES/51-10-STRUCTURAL-STANDARDS/) — Standard practices and structural design standards ✓

---

### [52-DOORS/](./52-DOORS/)

**ATA Chapter 52** — Doors

**Sub-zones**

* [52-10-PASSENGER-DOORS/](./52-DOORS/52-10-PASSENGER-DOORS/) — Passenger entry and emergency exit doors ✓

---

### [53-FUSELAGE-STRUCTURES/](./53-FUSELAGE-STRUCTURES/)

**ATA Chapter 53** — Fuselage body structures

**Sub-zones**

* [53-10-CENTER-BODY/](./53-FUSELAGE-STRUCTURES/53-10-CENTER-BODY/) — Central fuselage & wing carry-through ✓
  • Assembly sequence example:
    → [53-10-CB-ASSY-SEQ-0001.md](./53-FUSELAGE-STRUCTURES/53-10-CENTER-BODY/PLM/CAD/ASSY/assembly-sequences/53-10-CB-ASSY-SEQ-0001.md)
* (Forward / aft sections to be added)

---

### [54-NACELLES-PYLONS/](./54-NACELLES-PYLONS/)  *(shared with PPP domain)*

**ATA Chapter 54** — Nacelles and Pylons

**Sub-zones**

* [54-00-GENERAL/](./54-NACELLES-PYLONS/54-00-GENERAL/) — Zone governance, HAZOP/FTA, requirements matrices ✓
* [54-10-NACELLE-STRUCTURE/](./54-NACELLES-PYLONS/54-10-NACELLE-STRUCTURE/) — Inlet, fan cowl, outer barrel, access doors ✓
* [54-20-PYLON-STRUT/](./54-NACELLES-PYLONS/54-20-PYLON-STRUT/) — Primary/secondary load paths, engine mounts ✓
* [54-30-THRUST-REVERSER-STRUCTURE/](./54-NACELLES-PYLONS/54-30-THRUST-REVERSER-STRUCTURE/) — TR structural elements (interfaces with ATA 78/PPP) ✓
* [54-40-FIRE-THERMAL-ACOUSTICS/](./54-NACELLES-PYLONS/54-40-FIRE-THERMAL-ACOUSTICS/) — Firewalls, thermal blankets, acoustic liners ✓

---

### [55-STABILIZERS/](./55-STABILIZERS/)

**ATA Chapter 55** — Stabilizers

**Sub-zones**

* [55-00-GENERAL/](./55-STABILIZERS/55-00-GENERAL/) — Policies, loads, interfaces ✓
* [55-10-HORIZONTAL-STABILIZER/](./55-STABILIZERS/55-10-HORIZONTAL-STABILIZER/) — H-stab primary/secondary structure ✓
* [55-20-VERTICAL-STABILIZER/](./55-STABILIZERS/55-20-VERTICAL-STABILIZER/) — V-stab primary/secondary structure ✓

---

### [56-WINDOWS/](./56-WINDOWS/)

**ATA Chapter 56** — Windows

**Sub-zones**

* [56-00-GENERAL/](./56-WINDOWS/56-00-GENERAL/) — Policies, materials & test methods ✓
* [56-10-FRAMES-SEALS/](./56-WINDOWS/56-10-FRAMES-SEALS/) — Frames, seals, bonding ✓
* [56-20-PANES-MATERIALS/](./56-WINDOWS/56-20-PANES-MATERIALS/) — Panes, transparencies, materials ✓
* [56-30-ANTI-ICE-DEFOG/](./56-WINDOWS/56-30-ANTI-ICE-DEFOG/) — Electrical anti-ice, defog ✓
* [56-40-INSPECTION-REPAIR/](./56-WINDOWS/56-40-INSPECTION-REPAIR/) — NDI, repair manuals, criteria ✓

---

### [57-WING-STRUCTURES/](./57-WING-STRUCTURES/)

**ATA Chapter 57** — Wing structures and aerodynamic surfaces

**Sub-zones**

* [57-10-BOX-SECTION/](./57-WING-STRUCTURES/57-10-BOX-SECTION/) — Wing box primary structure ✓
* (Leading/trailing edge to be added)

---

## Additional ATA Chapters (To Be Implemented)

Per taxonomy ([ata-chapters.csv](../../../../1-DIMENSIONS/CANONICAL-TAXONOMY/ata-chapters.csv)), AAA owns:

* **06** — Dimensions & Stations ✓
* **14** — Hardware ✓
* **50** — Cargo & Accessory Compartments ✓
* **51** — Standard Practices & Structures ✓
* **52** — Doors ✓
* **53** — Fuselage ✓
* **54** — Nacelles/Pylons (shared with PPP) ✓
* **55** — Stabilizers ✓
* **56** — Windows ✓
* **57** — Wings ✓
* **62** — Main Rotor (helicopters)
* **64** — Tail Rotor (helicopters)
* **65** — Tail Rotor Drive (helicopters)
* **66** — Folding Blades/Pylon

---

## Sub-Zone Naming Convention

Format: `[ATA]-[SUBSYSTEM-NUMBER]-[DESCRIPTIVE-NAME]/`

**Example:** `53-10-CENTER-BODY/`

Where:

* `53` = ATA chapter
* `10` = Sub-system identifier (typically increments by 10)
* `CENTER-BODY` = Descriptive name in UPPERCASE with hyphens

---

## BEZ Structure (per sub-zone)

```
[SUB-ZONE]/
├─ DELs/                   # Deliveries
├─ CAP/                    # Computer-Aided Processes (ONB/OUT/DEL flows)
├─ PLM/                    # Product Lifecycle Management
├─ PROCUREMENT/            # Vendor and component procurement
├─ QUANTUM_OA/             # Quantum optimization algorithms
├─ SUPPLIERS/              # Supplier bids and services
├─ policy/                 # Domain-specific policies
├─ tests/                  # Test artifacts and results
├─ META.json               # Metadata
├─ README.md               # Sub-zone documentation
└─ domain-config.yaml      # Configuration
```

---

## Cross-References

* Taxonomy: [ATA Chapter Assignments (README)](../../../../1-DIMENSIONS/CANONICAL-TAXONOMY/ata-chapters.README.md) · [CSV](../../../../1-DIMENSIONS/CANONICAL-TAXONOMY/ata-chapters.csv)
* AAA Domain: [AAA README](../README.md)

---

## Status

🚧 **In Development** — Additional zones and sub-zones will be added as project requirements are defined.
