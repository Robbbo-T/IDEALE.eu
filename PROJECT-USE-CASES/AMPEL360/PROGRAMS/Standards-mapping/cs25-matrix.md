# CS-25 Certification Matrix - AMPEL360 H2-BWB-Q100

**Version:** 2.0  
**Last Updated:** 2025-01-20  
**Certification Basis:** EASA CS-25 Amendment 28 + Special Conditions

## Overview

This document maps EASA CS-25 (Large Aeroplanes) requirements to the AMPEL360 H2-BWB-Q100 design, identifying compliance approach and special conditions required for hydrogen propulsion and blended wing body configuration.

## Compliance Status Legend

- ✅ **STANDARD**: Conventional compliance approach
- ⚠️ **ADAPTED**: Modified compliance with justification
- 🔶 **SPECIAL CONDITION**: Requires Special Condition development
- ❌ **NOT APPLICABLE**: Section not applicable to design

## Subpart A - General

| Para | Title | Status | Compliance Approach | Notes |
|------|-------|--------|---------------------|-------|
| 25.1 | Applicability | ✅ | Standard | Transport category, >19 seats |
| 25.3 | Special retroactive requirements | ✅ | Standard | N/A for new type design |
| 25.5 | Incorporation by reference | ✅ | Standard | All referenced standards apply |

## Subpart B - Flight

### General

| Para | Title | Status | Compliance Approach | Notes |
|------|-------|--------|---------------------|-------|
| 25.21 | Proof of compliance | ⚠️ | Adapted | Flight test + validated simulation for BWB |
| 25.23 | Load distribution limits | ✅ | Standard | CG range analysis required |
| 25.25 | Weight limits | ✅ | Standard | MTOW 180,000 kg |
| 25.27 | Centre of gravity limits | ⚠️ | Adapted | BWB-specific CG range |
| 25.29 | Empty weight and CG | ✅ | Standard | Weight control program |

### Performance

| Para | Title | Status | Compliance Approach | Notes |
|------|-------|--------|---------------------|-------|
| 25.101 | General | ✅ | Standard | All conditions addressed |
| 25.103 | Stall speed | ⚠️ | Adapted | BWB stall characteristics unique |
| 25.105 | Takeoff | ✅ | Standard | Performance analysis |
| 25.107 | Takeoff speeds | ✅ | Standard | V1, VR, V2 determination |
| 25.109 | Accelerate-stop distance | ✅ | Standard | Balanced field length |
| 25.111 | Takeoff path | ✅ | Standard | Obstacle clearance |
| 25.113 | Takeoff distance and run | ✅ | Standard | Performance data |
| 25.115 | Takeoff flight path | ✅ | Standard | Net takeoff path |
| 25.117 | Climb: general | 🔶 | Special Condition | Electric propulsion characteristics |
| 25.119 | Landing climb: All-engines | ✅ | Standard | Go-around capability |
| 25.121 | Climb: One-engine inoperative | 🔶 | Special Condition | Distributed propulsion redundancy |
| 25.123 | En route flight paths | ✅ | Standard | Cruise performance |
| 25.125 | Landing | ✅ | Standard | Approach and landing |

### Controllability and Manoeuvrability

| Para | Title | Status | Compliance Approach | Notes |
|------|-------|--------|---------------------|-------|
| 25.143 | General | ⚠️ | Adapted | BWB-specific control laws |
| 25.145 | Longitudinal control | ⚠️ | Adapted | Pitch control via elevons |
| 25.147 | Directional and lateral control | ⚠️ | Adapted | Yaw control via drag rudders |
| 25.149 | Minimum control speed | ⚠️ | Adapted | VMC with distributed propulsion |

### Trim

| Para | Title | Status | Compliance Approach | Notes |
|------|-------|--------|---------------------|-------|
| 25.161 | Trim | ⚠️ | Adapted | Electric trim system, BWB config |

### Stability

| Para | Title | Status | Compliance Approach | Notes |
|------|-------|--------|---------------------|-------|
| 25.171 | General | ⚠️ | Adapted | BWB inherent stability |
| 25.173 | Static longitudinal stability | ⚠️ | Adapted | Pitch stability characteristics |
| 25.175 | Demonstration of static long. stab | ⚠️ | Adapted | Flight test validation |
| 25.177 | Static lateral-directional stability | ⚠️ | Adapted | Dutch roll characteristics |
| 25.181 | Dynamic stability | ⚠️ | Adapted | Short period, phugoid modes |

### Stalls

| Para | Title | Status | Compliance Approach | Notes |
|------|-------|--------|---------------------|-------|
| 25.201 | Stall demonstration | ⚠️ | Adapted | BWB stall behavior validation |
| 25.203 | Stall characteristics | ⚠️ | Adapted | Non-conventional stall warning |
| 25.207 | Stall warning | 🔶 | Special Condition | BWB-specific stall warning system |

## Subpart C - Structure

### General

| Para | Title | Status | Compliance Approach | Notes |
|------|-------|--------|---------------------|-------|
| 25.301 | Loads | ✅ | Standard | FEA + test validation |
| 25.303 | Factor of safety | ✅ | Standard | 1.5 for ultimate loads |
| 25.305 | Strength and deformation | ✅ | Standard | Structural substantiation |
| 25.307 | Proof of structure | 🔶 | Special Condition | Non-cylindrical pressure vessel |

### Flight Loads

| Para | Title | Status | Compliance Approach | Notes |
|------|-------|--------|---------------------|-------|
| 25.321 | General | ⚠️ | Adapted | BWB aerodynamic loads |
| 25.331 | Symmetric manoeuvring cond. | ⚠️ | Adapted | Load distribution on BWB |
| 25.333 | Flight manoeuvring envelope | ✅ | Standard | V-n diagram |
| 25.335 | Design airspeeds | ✅ | Standard | VD, VC, VB determination |
| 25.337 | Limit manoeuvring load factors | ✅ | Standard | n=+2.5/-1.0g |
| 25.341 | Gust and turbulence loads | ⚠️ | Adapted | BWB response to gusts |
| 25.345 | High lift devices | ⚠️ | Adapted | Trailing edge devices |
| 25.349 | Rolling conditions | ⚠️ | Adapted | Aileron/elevon loads |
| 25.351 | Yaw manoeuvre conditions | ⚠️ | Adapted | Drag rudder loads |

### Ground Loads

| Para | Title | Status | Compliance Approach | Notes |
|------|-------|--------|---------------------|-------|
| 25.471 | General | ✅ | Standard | Landing gear design |
| 25.473 | Ground load cond. and assumptions | ✅ | Standard | Structural design |
| 25.477 | Landing gear arrangement | ✅ | Standard | Tricycle configuration |
| 25.479 | Level landing conditions | ✅ | Standard | Vertical descent |
| 25.481 | Tail down landing conditions | ❌ | Not Applicable | BWB configuration |
| 25.483 | One-wheel landing conditions | ✅ | Standard | Asymmetric landing |
| 25.485 | Side load conditions | ✅ | Standard | Crosswind landing |
| 25.491 | Taxi, takeoff and landing roll | ✅ | Standard | Ground maneuvers |
| 25.493 | Braked roll conditions | ✅ | Standard | Braking loads |
| 25.495 | Turning | ✅ | Standard | Ground turning loads |

### Pressurization

| Para | Title | Status | Compliance Approach | Notes |
|------|-------|--------|---------------------|-------|
| 25.365 | Pressurized cabin loads | 🔶 | Special Condition SC-BWB-01 | Non-cylindrical pressure vessel |
| 25.571 | Damage tolerance (pressurization) | 🔶 | Special Condition SC-BWB-01 | Inspectability, crack growth |

## Subpart D - Design and Construction

### General

| Para | Title | Status | Compliance Approach | Notes |
|------|-------|--------|---------------------|-------|
| 25.601 | General | ✅ | Standard | Design standards compliance |
| 25.603 | Materials | ✅ | Standard | Composite qualification |
| 25.605 | Fabrication methods | ✅ | Standard | Manufacturing process control |
| 25.607 | Fasteners | ✅ | Standard | Fastener qualification |
| 25.609 | Protection of structure | ✅ | Standard | Corrosion protection |
| 25.611 | Accessibility provisions | ⚠️ | Adapted | BWB internal access |
| 25.613 | Material strength properties | ✅ | Standard | Material allowables |
| 25.619 | Special factors | ✅ | Standard | Fitting factors |
| 25.621 | Casting factors | ✅ | Standard | If castings used |
| 25.623 | Bearing factors | ✅ | Standard | Bearing design |
| 25.625 | Fitting factors | ✅ | Standard | Design margins |

### Control Surfaces

| Para | Title | Status | Compliance Approach | Notes |
|------|-------|--------|---------------------|-------|
| 25.651 | Proof of strength | ⚠️ | Adapted | Elevon, drag rudder testing |
| 25.655 | Installation | ⚠️ | Adapted | Distributed control surfaces |
| 25.657 | Hinges | ✅ | Standard | Hinge design |
| 25.671 | General (control systems) | ⚠️ | Adapted | Fly-by-wire primary |
| 25.672 | Stability augmentation system | ⚠️ | Adapted | BWB-specific control laws |
| 25.675 | Stops | ✅ | Standard | Control surface stops |
| 25.677 | Trim systems | ✅ | Standard | Electric trim |
| 25.679 | Control system locks | ✅ | Standard | Gust locks |

### Landing Gear

| Para | Title | Status | Compliance Approach | Notes |
|------|-------|--------|---------------------|-------|
| 25.721 | General | ✅ | Standard | Retractable tricycle |
| 25.723 | Shock absorption tests | ✅ | Standard | Drop tests |
| 25.725 | Limit drop test | ✅ | Standard | Energy absorption |
| 25.727 | Reserve energy absorption drop test | ✅ | Standard | Ultimate conditions |
| 25.729 | Retracting mechanism | ✅ | Standard | Retraction system |
| 25.731 | Wheels | ✅ | Standard | Wheel selection |
| 25.733 | Tires | ✅ | Standard | Tire qualification |
| 25.735 | Brakes | ✅ | Standard | Carbon brakes |
| 25.737 | Skis | ❌ | Not Applicable | N/A |

## Subpart E - Powerplant

### General

| Para | Title | Status | Compliance Approach | Notes |
|------|-------|--------|---------------------|-------|
| 25.901 | Installation | 🔶 | Special Condition SC-H2-01 | H2 fuel cell + electric propulsion |
| 25.903 | Engines | 🔶 | Special Condition SC-H2-01 | Fuel cells as "engines" |
| 25.904 | Automatic takeoff thrust control | ⚠️ | Adapted | Electric motor control |
| 25.905 | Propellers | ⚠️ | Adapted | Electric motor-driven fans |
| 25.907 | Propeller vibration | ✅ | Standard | Vibration analysis |

### Fuel System

| Para | Title | Status | Compliance Approach | Notes |
|------|-------|--------|---------------------|-------|
| 25.951 | General | 🔶 | Special Condition SC-H2-01 | Liquid H2 fuel system |
| 25.952 | Fuel system analysis | 🔶 | Special Condition SC-H2-01 | H2-specific FMEA |
| 25.953 | Fuel system independence | 🔶 | Special Condition SC-H2-01 | H2 tank segregation |
| 25.954 | Fuel system lightning protection | 🔶 | Special Condition SC-H2-01 | H2 ignition prevention |
| 25.955 | Fuel flow | 🔶 | Special Condition SC-H2-01 | Cryogenic pumps |
| 25.957 | Flow between interconnected tanks | 🔶 | Special Condition SC-H2-02 | Tank cross-feed |
| 25.959 | Unusable fuel supply | 🔶 | Special Condition SC-H2-02 | H2 boil-off management |
| 25.961 | Fuel system hot weather operation | 🔶 | Special Condition SC-H2-02 | Cryogenic performance |
| 25.963 | Fuel tanks: general | 🔶 | Special Condition SC-H2-02 | Cryogenic tank design |
| 25.965 | Fuel tank tests | 🔶 | Special Condition SC-H2-02 | H2 tank qualification |
| 25.967 | Fuel tank installations | 🔶 | Special Condition SC-H2-02 | Tank crash protection |
| 25.969 | Fuel tank expansion space | 🔶 | Special Condition SC-H2-02 | Ullage management |
| 25.971 | Fuel tank sump | 🔶 | Special Condition SC-H2-02 | Drainage provisions |
| 25.973 | Fuel tank filler connection | 🔶 | Special Condition SC-H2-01 | Ground refueling interface |
| 25.975 | Fuel tank vents | 🔶 | Special Condition SC-H2-02 | H2 venting safety |
| 25.977 | Fuel tank outlet | 🔶 | Special Condition SC-H2-02 | Supply reliability |
| 25.979 | Pressure fueling system | 🔶 | Special Condition SC-H2-01 | Refueling procedures |
| 25.981 | Fuel tank ignition prevention | 🔶 | Special Condition SC-H2-01 | H2 ignition sources |

### Fuel Cell / Electric Propulsion

| Para | Title | Status | Compliance Approach | Notes |
|------|-------|--------|---------------------|-------|
| 25.1001 | Fuel jettisoning system | ❌ | Not Applicable | H2 vented, not jettisoned |
| 25.1011 | General (engine installations) | 🔶 | Special Condition SC-H2-01 | Fuel cell nacelle |
| 25.1013 | Fire protection | 🔶 | Special Condition SC-H2-01 | H2 fire detection/suppression |
| 25.1015 | Designated fire zones | 🔶 | Special Condition SC-H2-01 | Nacelle fire zones |

## Subpart F - Equipment

### General

| Para | Title | Status | Compliance Approach | Notes |
|------|-------|--------|---------------------|-------|
| 25.1301 | Function and installation | ✅ | Standard | Systems design |
| 25.1303 | Flight and navigation instruments | ✅ | Standard | Glass cockpit |
| 25.1305 | Powerplant instruments | 🔶 | Special Condition SC-H2-01 | Fuel cell monitoring |
| 25.1307 | Miscellaneous equipment | ✅ | Standard | Standard equipment |
| 25.1309 | Equipment, systems, and installations | ✅ | Standard | System safety assessment |
| 25.1310 | Power source capacity | ⚠️ | Adapted | Electric power management |
| 25.1316 | Electrical and electronic system lightning protection | ✅ | Standard | Lightning protection |
| 25.1317 | High-intensity Radiated Fields (HIRF) | ✅ | Standard | HIRF protection |

### Instruments: Installation

| Para | Title | Status | Compliance Approach | Notes |
|------|-------|--------|---------------------|-------|
| 25.1321 | Arrangement and visibility | ✅ | Standard | Cockpit layout |
| 25.1322 | Warning, caution, and advisory lights | ✅ | Standard | EICAS/ECAM equivalent |
| 25.1323 | Airspeed indicating system | ✅ | Standard | Pitot-static system |
| 25.1325 | Static pressure systems | ✅ | Standard | Alternate static |
| 25.1327 | Magnetic direction indicator | ✅ | Standard | Standby compass |

## Subpart G - Operating Limitations and Information

| Para | Title | Status | Compliance Approach | Notes |
|------|-------|--------|---------------------|-------|
| 25.1501 | General | ✅ | Standard | AFM (Aircraft Flight Manual) |
| 25.1503 | Airspeed limitations | ✅ | Standard | VMO/MMO |
| 25.1505 | Maximum operating limit speed | ✅ | Standard | VD/MD determination |
| 25.1507 | Manoeuvring speed | ✅ | Standard | VA |
| 25.1511 | Flap extended speed | ⚠️ | Adapted | High-lift device speeds |
| 25.1517 | Rough air speed, VRA | ✅ | Standard | Turbulence speed |
| 25.1519 | Weight and loading distribution | ✅ | Standard | Loading manual |
| 25.1521 | Powerplant limitations | 🔶 | Special Condition SC-H2-01 | Fuel cell operating limits |
| 25.1522 | Auxiliary power unit limitations | ✅ | Standard | APU (if installed) |
| 25.1523 | Minimum flight crew | ✅ | Standard | 2 pilots |
| 25.1525 | Kinds of operation | ✅ | Standard | Day, night, IFR, icing |
| 25.1527 | Ambient air temperature and op. alt | ✅ | Standard | Operating envelope |
| 25.1529 | Instructions for continued airworthiness | ✅ | Standard | Maintenance program |
| 25.1581 | General (markings and placards) | 🔶 | Special Condition SC-H2-01 | H2 safety markings |
| 25.1583 | Operating limitations | 🔶 | Special Condition SC-H2-01 | H2 system limitations |

## Special Conditions Summary

### SC-H2-01: Hydrogen Fuel System Installation

**Status:** Draft under development with EASA  
**Expected Publication:** 2026 Q2

**Key Requirements:**
1. Fuel containment and crash protection (16g forward, 8g lateral/vertical)
2. Leak detection with 0.1% sensitivity
3. H2-specific fire detection and suppression
4. Rapid ventilation (10 air changes/min minimum)
5. Lightning strike protection (direct and indirect)
6. Ground handling safety procedures
7. Maintenance accessibility requirements

**Compliance Approach:**
- Drop tests, fire tests, lightning tests
- CFD analysis (leak dispersion)
- FEA (structural integrity)
- FMEA (safety analysis)
- Test report package

---

### SC-BWB-01: Blended Wing Body Configuration

**Status:** Conceptual discussion with EASA  
**Expected Publication:** 2027 Q1

**Key Requirements:**
1. Non-cylindrical pressure vessel structural integrity
2. Emergency egress (<90 seconds for 180 passengers)
3. Ditching characteristics and flotation
4. Structural inspectability (non-cylindrical access)
5. Damage tolerance and crack propagation
6. Passenger safety equivalent to conventional aircraft

**Compliance Approach:**
- Ultimate load test (1.5x limit)
- Fatigue testing (2 lifetimes)
- Pressure cycling (20,000 cycles)
- Full-scale evacuation demonstration
- Ditching simulation and testing
- Structural health monitoring system

---

### SC-H2-02: Hydrogen Storage Tank Systems

**Status:** Under discussion with EASA  
**Expected Publication:** 2026 Q4

**Key Requirements:**
1. Cryogenic tank qualification (-253°C operation)
2. Boil-off management (<1% per day target)
3. Tank fill and drain procedures
4. Ground handling safety
5. In-flight venting safety
6. Emergency defueling procedures

**Compliance Approach:**
- Cryogenic cycling tests
- Vacuum performance tests
- Boil-off measurement
- Safety system validation
- Procedure validation tests

---

## Certification Test Program Summary

### Ground Testing
- Static test (ultimate loads): €150M, 18 months
- Fatigue test (2 lifetimes): €100M, 24 months
- Pressure cycles (20,000): €50M, 12 months
- H2 system qualification: €200M, 24 months

### Flight Testing
- 3 test aircraft
- 2,000 flight hours
- 600 flights
- €800M, 30 months

### Total Certification Investment
**€2.5B for cargo variant (2027-2030)**

---

**Document Control:**
- **Version:** 2.0
- **Approval:** AMPEL360 Certification Board + EASA (as engagement progresses)
- **Next Review:** Quarterly updates as Special Conditions develop
