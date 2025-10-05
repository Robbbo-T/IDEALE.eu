#!/usr/bin/env python3
"""
Royalty Accrual Script for IDEALE.eu Artifacts

This script processes artifact metadata and accrues royalties according to the
configured distribution model, including support for meta-assets (tooling & infrastructure).
"""

import json
import pathlib
import sys
from datetime import datetime, timezone


ROOT = pathlib.Path(__file__).resolve().parents[1]
CONF = ROOT / "config" / "royalties.json"
LEDG = ROOT / "royalties" / "ledger.jsonl"
META_REG = ROOT / "standards" / "v0.1" / "meta-assets.registry.json"


def load_json(p):
    """Load JSON from file path."""
    return json.loads(pathlib.Path(p).read_text(encoding="utf-8"))


def load_json_optional(p, default):
    """Load JSON from file path, returning default if file doesn't exist."""
    try:
        return load_json(p)
    except Exception:
        return default


def now():
    """Return current ISO 8601 timestamp."""
    return datetime.now(timezone.utc).isoformat()


def accrue(artifact_meta_path, event, declared_value_eur=None):
    """
    Accrue royalties for an artifact.
    
    Args:
        artifact_meta_path: Path to artifact.json metadata file
        event: Event type triggering the accrual (e.g., "PR_MERGE", "RELEASE")
        declared_value_eur: Optional override for declared value
    """
    meta = load_json(artifact_meta_path)
    conf = load_json(CONF)
    registry = load_json_optional(META_REG, {"assets": []})
    
    art = meta["artifact"]
    fee_bps = int(conf.get("fee_bps", 10))
    dv_eur = float(declared_value_eur if declared_value_eur is not None else art.get("declared_value_eur", 0.0))
    fee_eur = dv_eur * (fee_bps / 10000.0)

    dist = conf["distribution"]
    creators = fee_eur * (dist["creators_bps_of_fee"] / 10000.0)
    validators = fee_eur * (dist.get("validators_bps_of_fee", 0) / 10000.0)
    infra = fee_eur * (dist.get("infra_bps_of_fee", 0) / 10000.0)
    treasury = fee_eur * (dist.get("treasury_bps_of_fee", 0) / 10000.0)

    # Allocations to creators
    revshare = art.get("revshare", {})
    allocations = revshare.get("allocations", [])
    total_bps = sum([a["share_bps"] for a in allocations])
    
    alloc = []
    for a in allocations:
        share = creators * (a["share_bps"] / total_bps) if total_bps > 0 else 0.0
        alloc.append({
            "id": a["id"],
            "share_bps": a["share_bps"],
            "amount_eur": round(share, 6)
        })

    # --- Meta allocations (Infra & Tooling) ---
    used = (art.get("tooling", {}) or {}).get("used", []) or []
    sum_w = sum([(u.get("weight") or 0) for u in used])
    meta_alloc = []
    
    if infra > 0 and used:
        def resolve_payout(u):
            """Resolve payout information for a meta-asset."""
            # priority: payoutHint → registry
            if u.get("payoutHint"):
                return u["payoutHint"]
            asset = next((x for x in registry.get("assets", []) if x.get("id") == u.get("id")), None)
            if asset and asset.get("maintainers"):
                # if there are multiple maintainers, split equally
                return {
                    "tt": asset["maintainers"][0]["payout"]["tt"],
                    "iban": asset["maintainers"][0]["payout"].get("iban")
                }
            return {"tt": None, "iban": None}

        if sum_w == 0:
            # repartir a partes iguales
            per = infra / float(len(used))
            for u in used:
                meta_alloc.append({
                    "id": u.get("id"),
                    "version": u.get("version"),
                    "weight": u.get("weight"),
                    "amount_eur": round(per, 6),
                    "payout": resolve_payout(u)
                })
        else:
            for u in used:
                w = (u.get("weight") or 0)
                share = infra * (w / sum_w) if sum_w > 0 else 0.0
                meta_alloc.append({
                    "id": u.get("id"),
                    "version": u.get("version"),
                    "weight": w,
                    "amount_eur": round(share, 6),
                    "payout": resolve_payout(u)
                })

    # Create ledger entry
    entry = {
        "ts": now(),
        "type": "ROYALTY_ACCRUE",
        "artifact_hash": art["content_hash"],
        "event": event,
        "declared_value_eur": round(dv_eur, 6),
        "fee_bps": fee_bps,
        "fee_eur": round(fee_eur, 6),
        "split": {
            "creators_eur": round(creators, 6),
            "validators_eur": round(validators, 6),
            "infra_eur": round(infra, 6),
            "treasury_eur": round(treasury, 6)
        },
        "allocations": alloc,
        "meta": meta_alloc
    }

    # Ensure ledger directory exists
    LEDG.parent.mkdir(parents=True, exist_ok=True)
    
    # Append to ledger
    with open(LEDG, "a", encoding="utf-8") as f:
        f.write(json.dumps(entry, ensure_ascii=False) + "\n")
    
    print(f"✓ Accrued royalty: {fee_eur:.2f} EUR")
    print(f"  Creators: {creators:.2f} EUR ({len(alloc)} allocations)")
    print(f"  Validators: {validators:.2f} EUR")
    print(f"  Infra/Tooling: {infra:.2f} EUR ({len(meta_alloc)} meta-assets)")
    print(f"  Treasury: {treasury:.2f} EUR")
    print(f"  Ledger: {LEDG}")
    
    return entry


def main():
    """Main CLI entry point."""
    if len(sys.argv) < 3:
        print("Usage: accrue_royalty.py <artifact.json> <event> [declared_value_eur]")
        print()
        print("Example:")
        print("  accrue_royalty.py artifacts/my-design/artifact.json PR_MERGE")
        print("  accrue_royalty.py artifacts/my-design/artifact.json RELEASE 15000")
        sys.exit(1)
    
    artifact_path = sys.argv[1]
    event = sys.argv[2]
    declared_value = float(sys.argv[3]) if len(sys.argv) > 3 else None
    
    try:
        accrue(artifact_path, event, declared_value)
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
