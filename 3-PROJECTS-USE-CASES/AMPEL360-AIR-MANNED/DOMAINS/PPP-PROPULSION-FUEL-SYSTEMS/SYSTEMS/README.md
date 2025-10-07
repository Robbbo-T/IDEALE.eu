# PPP Domain SYSTEMS — AMPEL360-AIR-MANNED

This directory organizes propulsion and fuel systems according to ATA chapter assignments.

## Structure

Each system is organized by ATA chapter number and contains the complete BEZ (Bloque de Estructura Base) at the system level.

## Systems Defined

### 71-POWER-PLANT/
**ATA Chapter 71** - Power Plant (General)

Complete propulsion system including engine, mounting, and primary interfaces.

## Additional ATA Chapters (To Be Implemented)

According to [ata-chapters.csv](../../../../1-DIMENSIONS/CANONICAL-TAXONOMY/ata-chapters.csv), the PPP domain owns:

- **28** - Fuel Systems
- **49** - Airborne Auxiliary Power (APU)
- **54** - Nacelles/Pylons (shared with AAA)
- **60** - Standard Practices - Propeller/Rotor
- **61** - Propellers/Propulsors
- **70** - Standard Practices - Engine
- **71** - Power Plant ✓ (implemented)
- **72** - Engine (Turbine/Piston)
- **73** - Engine Fuel and Control
- **75** - Air (Engine Bleed)
- **78** - Exhaust
- **81** - Turbines
- **82** - Water Injection

## System Naming Convention

Format: `[ATA]-[DESCRIPTIVE-NAME]/`

Example: `71-POWER-PLANT/`

Where:
- `71` = ATA chapter
- `POWER-PLANT` = System name in uppercase with hyphens

## BEZ Structure

Each system (lowest level) contains the complete BEZ:

```
[SYSTEM]/
├─ DELs/                   # Design Evidence Lists
├─ PAx/                    # Packaging (ONB/OUT)
├─ PLM/                    # Product Lifecycle Management
├─ PROCUREMENT/            # Vendor and component procurement
├─ QUANTUM_OA/             # Quantum optimization algorithms
├─ SUPPLIERS/              # Supplier bids and services
├─ policy/                 # Domain-specific policies
├─ tests/                  # Test artifacts and results
├─ META.json              # Metadata
├─ README.md              # System documentation
└─ domain-config.yaml     # Configuration
```

## Cross-References

- [ATA Chapter Assignments](../../../../1-DIMENSIONS/CANONICAL-TAXONOMY/ata-chapters.README.md)
- [PPP Domain README](../README.md)
- [ATA Structure Example](../ATA-STRUCTURE-EXAMPLE.md)

## Status

🚧 In Development — Additional systems to be added as project requirements are defined.
