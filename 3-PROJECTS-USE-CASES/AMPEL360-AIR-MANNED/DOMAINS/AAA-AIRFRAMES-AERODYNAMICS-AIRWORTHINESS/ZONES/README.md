# AAA Domain ZONES — AMPEL360-AIR-MANNED

This directory organizes structural zones according to ATA chapter assignments.

## Structure

Each zone is organized by ATA chapter number and contains sub-zones where the complete BEZ (Bloque de Estructura Base) is applied.

## Zones Defined

### 06-DIMENSIONS-STATIONS/
**ATA Chapter 06** - Dimensions and Stations

Sub-zones:
- `06-10-REFERENCE-FRAME/` — Aircraft reference frame and datum system ✓

### 14-HARDWARE-ZONES/
**ATA Chapter 14** - Hardware (Zones)

Sub-zones:
- `14-10-ZONE-DEFINITIONS/` — Aircraft zone classification system ✓

### 50-CARGO-ACCESSORY-COMPARTMENTS/
**ATA Chapter 50** - Cargo and Accessory Compartments

Sub-zones:
- `50-10-CARGO-HOLDS/` — Cargo and baggage compartment structures ✓

### 51-STANDARD-PRACTICES-STRUCTURES/
**ATA Chapter 51** - Standard Practices and Structures

Sub-zones:
- `51-10-STRUCTURAL-STANDARDS/` — Standard practices and structural design standards ✓

### 52-DOORS/
**ATA Chapter 52** - Doors

Sub-zones:
- `52-10-PASSENGER-DOORS/` — Passenger entry and emergency exit doors ✓

### 53-FUSELAGE-STRUCTURES/
**ATA Chapter 53** - Fuselage body structures

Sub-zones:
- `53-10-CENTER-BODY/` — Central fuselage section and wing carry-through ✓
- Additional sub-zones to be defined (forward section, aft section, etc.)

### 57-WING-STRUCTURES/
**ATA Chapter 57** - Wing structures and aerodynamic surfaces

Sub-zones:
- `57-10-BOX-SECTION/` — Wing box primary structure ✓
- Additional sub-zones to be defined (leading edge, trailing edge, etc.)

## Additional ATA Chapters (To Be Implemented)

According to [ata-chapters.csv](../../../../1-DIMENSIONS/CANONICAL-TAXONOMY/ata-chapters.csv), the AAA domain owns:

- **06** - Dimensions and Stations ✓ (implemented)
- **14** - Hardware (Zones) ✓ (implemented)
- **50** - Cargo and Accessory Compartments ✓ (implemented)
- **51** - Standard Practices and Structures ✓ (implemented)
- **52** - Doors ✓ (implemented)
- **53** - Fuselage ✓ (implemented)
- **54** - Nacelles/Pylons (shared with PPP)
- **55** - Stabilizers
- **56** - Windows
- **57** - Wings ✓ (implemented)
- **62** - Main Rotor (helicopters)
- **64** - Tail Rotor (helicopters)
- **65** - Tail Rotor Drive (helicopters)
- **66** - Folding Blades/Pylon

## Sub-Zone Naming Convention

Format: `[ATA]-[SUBSYSTEM-NUMBER]-[DESCRIPTIVE-NAME]/`

Example: `53-10-CENTER-BODY/`

Where:
- `53` = ATA chapter
- `10` = Sub-system identifier (typically increments by 10)
- `CENTER-BODY` = Descriptive name in uppercase with hyphens

## BEZ Structure

Each sub-zone (lowest level) contains the complete BEZ:

```
[SUB-ZONE]/
├─ DELs/                   # Deliveries
├─ PAx/                    # Packaging (ONB/OUT)
├─ PLM/                    # Product Lifecycle Management
├─ PROCUREMENT/            # Vendor and component procurement
├─ QUANTUM_OA/             # Quantum optimization algorithms
├─ SUPPLIERS/              # Supplier bids and services
├─ policy/                 # Domain-specific policies
├─ tests/                  # Test artifacts and results
├─ META.json              # Metadata
├─ README.md              # Sub-zone documentation
└─ domain-config.yaml     # Configuration
```

## Cross-References

- [ATA Chapter Assignments](../../../../1-DIMENSIONS/CANONICAL-TAXONOMY/ata-chapters.README.md)
- [AAA Domain README](../README.md)
- [ATA Structure Example](../ATA-STRUCTURE-EXAMPLE.md)

## Status

🚧 In Development — Additional zones and sub-zones to be added as project requirements are defined.
