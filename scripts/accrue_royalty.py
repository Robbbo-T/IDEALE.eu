#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Royalty Accrual Script for IDEALE.eu Artifacts

- Reads artifact metadata (artifact.json)
- Applies royalty fee and distribution from config/royalties.json
- Supports Infra & Tooling (meta-assets) weighted payouts via standards/v0.1/meta-assets.registry.json
- Appends a ROYALTY_ACCRUE record to royalties/ledger.jsonl
"""

import json
import pathlib
import sys
from datetime import datetime, timezone
from typing import Any, Dict, List, Optional

ROOT = pathlib.Path(__file__).resolve().parents[1]
CONF = ROOT / "config" / "royalties.json"
LEDG = ROOT / "royalties" / "ledger.jsonl"
META_REG = ROOT / "standards" / "v0.1" / "meta-assets.registry.json"


# ---------- utils ----------

def now_iso() -> str:
    """UTC ISO8601 with Z."""
    return datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")


def load_json(p: pathlib.Path | str) -> Dict[str, Any]:
    return json.loads(pathlib.Path(p).read_text(encoding="utf-8"))


def load_json_optional(p: pathlib.Path | str, default: Any) -> Any:
    try:
        return load_json(p)
    except Exception:
        return default


def write_jsonl_line(p: pathlib.Path, obj: Dict[str, Any]) -> None:
    p.parent.mkdir(parents=True, exist_ok=True)
    with p.open("a", encoding="utf-8", newline="\n") as fh:
        fh.write(json.dumps(obj, separators=(",", ":"), ensure_ascii=False) + "\n")


# ---------- core ----------

def _resolve_meta_payout_hint(u: Dict[str, Any], registry: Dict[str, Any]) -> Dict[str, Optional[str]]:
    """
    Determine payout routing for a meta-asset:
    1) respect inline payoutHint if present
    2) otherwise try to resolve from registry (first maintainer)
    3) fallback to nulls
    """
    if u.get("payoutHint"):
        return {
            "tt": u["payoutHint"].get("tt"),
            "iban": u["payoutHint"].get("iban"),
        }

    asset = next((x for x in registry.get("assets", []) if x.get("id") == u.get("id")), None)
    if asset and asset.get("maintainers"):
        m0 = asset["maintainers"][0]
        payout = m0.get("payout", {})
        return {"tt": payout.get("tt"), "iban": payout.get("iban")}

    return {"tt": None, "iban": None}


def _compute_creator_allocations(creators_eur: float, art: Dict[str, Any]) -> List[Dict[str, Any]]:
    """
    Support both:
      revshare: { total_bps: 10000, allocations: [{id, share_bps}] }
    and:
      revshare: { allocations: [{id, share_bps}] }  # infer total from sum
    If no revshare present or empty, returns [].
    """
    rev = art.get("revshare") or {}
    allocations = rev.get("allocations") or []
    if not allocations:
        return []

    total_bps = rev.get("total_bps")
    if total_bps is None:
        total_bps = sum(int(a.get("share_bps", 0)) for a in allocations)

    total_bps = int(total_bps or 0)
    out: List[Dict[str, Any]] = []
    for a in allocations:
        sbps = int(a.get("share_bps", 0))
        share = creators_eur * (sbps / total_bps) if total_bps > 0 else 0.0
        out.append({
            "id": a.get("id"),
            "share_bps": sbps,
            "amount_eur": round(share, 6),
        })
    return out


def _compute_meta_allocations(infra_eur: float, art: Dict[str, Any], registry: Dict[str, Any]) -> List[Dict[str, Any]]:
    """
    Distribute infra_eur across tooling.used by weight (or equally if weights missing/zero).
    """
    used = (art.get("tooling", {}) or {}).get("used", []) or []
    if infra_eur <= 0 or not used:
        return []

    weights = [(u.get("weight") or 0.0) for u in used]
    sum_w = float(sum(weights))

    meta_alloc: List[Dict[str, Any]] = []
    if sum_w <= 0:
        # equal split
        per = infra_eur / float(len(used))
        for u in used:
            meta_alloc.append({
                "id": u.get("id"),
                "version": u.get("version"),
                "weight": u.get("weight"),
                "amount_eur": round(per, 6),
                "payout": _resolve_meta_payout_hint(u, registry),
            })
    else:
        for u in used:
            w = float(u.get("weight") or 0.0)
            share = infra_eur * (w / sum_w)
            meta_alloc.append({
                "id": u.get("id"),
                "version": u.get("version"),
                "weight": w,
                "amount_eur": round(share, 6),
                "payout": _resolve_meta_payout_hint(u, registry),
            })
    return meta_alloc


def accrue(artifact_meta_path: str | pathlib.Path, event: str, declared_value_eur: Optional[float] = None) -> Dict[str, Any]:
    """
    Accrue royalties for a given artifact.json.

    Args:
        artifact_meta_path: path to artifact metadata file
        event: triggering event, e.g. "PR_MERGE", "RELEASE", "reuse"
        declared_value_eur: optional override; otherwise use artifact.artifact.declared_value_eur
    """
    meta = load_json(artifact_meta_path)
    conf = load_json(CONF)
    registry = load_json_optional(META_REG, {"assets": []})

    art = meta["artifact"]
    fee_bps = int(conf.get("fee_bps", 10))
    dv_eur = float(declared_value_eur if declared_value_eur is not None else art.get("declared_value_eur", 0.0))
    fee_eur = dv_eur * (fee_bps / 10000.0)

    # distribution (allow optional keys; absent -> 0)
    dist = conf.get("distribution", {})
    creators = fee_eur * (float(dist.get("creators_bps_of_fee", 0)) / 10000.0)
    validators = fee_eur * (float(dist.get("validators_bps_of_fee", 0)) / 10000.0)
    infra = fee_eur * (float(dist.get("infra_bps_of_fee", 0)) / 10000.0)
    treasury = fee_eur * (float(dist.get("treasury_bps_of_fee", 0)) / 10000.0)

    # allocations
    creator_alloc = _compute_creator_allocations(creators, art)
    meta_alloc = _compute_meta_allocations(infra, art, registry)

    entry: Dict[str, Any] = {
        "ts": now_iso(),
        "type": "ROYALTY_ACCRUE",
        "artifact_hash": art.get("content_hash"),
        "event": event,
        "declared_value_eur": round(dv_eur, 6),
        "fee_bps": fee_bps,
        "fee_eur": round(fee_eur, 6),
        "split": {
            "creators_eur": round(creators, 6),
            "validators_eur": round(validators, 6),
            "infra_eur": round(infra, 6),
            "treasury_eur": round(treasury, 6),
        },
        "allocations": creator_alloc,
    }

    # Include meta allocations only when non-empty to keep lines compact
    if meta_alloc:
        entry["meta"] = meta_alloc

    write_jsonl_line(LEDG, entry)

    # friendly CLI summary
    print(f"✓ Accrued royalty: {entry['fee_eur']:.2f} EUR")
    print(f"  Creators: {entry['split']['creators_eur']:.2f} EUR ({len(creator_alloc)} allocations)")
    print(f"  Validators: {entry['split']['validators_eur']:.2f} EUR")
    print(f"  Infra/Tooling: {entry['split']['infra_eur']:.2f} EUR ({len(meta_alloc)} meta-assets)")
    print(f"  Treasury: {entry['split']['treasury_eur']:.2f} EUR")
    print(f"  Ledger: {LEDG}")

    return entry


# ---------- cli ----------

def _usage() -> None:
    print("Usage: accrue_royalty.py <artifact.json> <event> [declared_value_eur]", file=sys.stderr)
    print()
    print("Examples:")
    print("  accrue_royalty.py artifacts/my-design/artifact.json PR_MERGE")
    print("  accrue_royalty.py artifacts/my-design/artifact.json RELEASE 15000")


def main(argv: List[str]) -> int:
    if len(argv) < 3:
        _usage()
        return 2

    artifact_path = argv[1]
    event = argv[2]
    declared_value = float(argv[3]) if len(argv) > 3 else None

    try:
        out = accrue(artifact_path, event, declared_value)
        # also print the JSON for machine consumption
        print(json.dumps(out, indent=2, ensure_ascii=False))
        return 0
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    sys.exit(main(sys.argv))
