# Airbus ↔ Safran Collaboration Demo

This demonstration shows how IDEALE.eu enables seamless artifact exchange between OEMs and Tier-1 suppliers without vendor lock-in.

## Scenario

1. **Airbus** designs a wing component in CATIA
2. Exports as **verifiable IDEALE artifact** (IEF format)
3. **Safran** receives artifact and opens in Siemens NX
4. Safran modifies for propulsion integration
5. Signs and returns modified artifact
6. **Both organizations' IP is protected** with full provenance

## Files

- `shared-artifacts/` - Artifacts exchanged between organizations
- `provenance-log/` - Complete audit trail of all operations
- `ip-attribution/` - IP ownership and contribution records

## Run the Demo

```bash
# Step 1: Airbus creates artifact
python evidence-engine/artifact-generator/create-verifiable-artifact.py \
  --input examples/wing-component.step \
  --out integration-demos/airbus-safran-collaboration/shared-artifacts/wing-v1.ief.json \
  --creator "Airbus Design Engineer" \
  --tool "CATIA V5 R21"

# Step 2: Airbus signs artifact
python evidence-engine/artifact-generator/sign-artifact.py \
  --in integration-demos/airbus-safran-collaboration/shared-artifacts/wing-v1.ief.json \
  --key airbus-private-key.pem

# Step 3: Transfer to Safran (verify first)
python evidence-engine/artifact-generator/verify-artifact.py \
  --in integration-demos/airbus-safran-collaboration/shared-artifacts/wing-v1.ief.json \
  --cert airbus-public-cert.pem

# Step 4: Safran modifies (simulated)
# Opens in NX, makes changes, exports new version

# Step 5: Anchor complete provenance
python evidence-engine/provenance-tracker/blockchain-anchor.py \
  --in integration-demos/airbus-safran-collaboration/shared-artifacts/wing-v2.ief.json \
  --network polygon
```

## Key Benefits Demonstrated

✅ **No tool lock-in** - Works with CATIA, NX, or any other tool
✅ **Full provenance** - Every change tracked and signed
✅ **IP protection** - Clear attribution of who did what
✅ **Legal defensibility** - Court-admissible evidence
✅ **Zero information loss** - Geometry and metadata preserved
