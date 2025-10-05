#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import json, sys, pathlib
from datetime import datetime, timezone

ROOT = pathlib.Path(__file__).resolve().parents[1]
CONF = ROOT / "config" / "royalties.json"
LEDG = ROOT / "royalties" / "ledger.jsonl"

def now():
    return datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")

def load_json(p):
    return json.loads(pathlib.Path(p).read_text(encoding="utf-8"))

def write_jsonl_line(p, obj):
    p.parent.mkdir(parents=True, exist_ok=True)
    with p.open("a", encoding="utf-8", newline="\n") as fh:
        fh.write(json.dumps(obj, separators=(",", ":"), ensure_ascii=False) + "\n")

def accrue(artifact_meta_path, event, declared_value_eur=None):
    meta = load_json(artifact_meta_path)
    conf = load_json(CONF)
    art = meta["artifact"]
    fee_bps = int(conf.get("fee_bps", 10))
    dv_eur = float(declared_value_eur if declared_value_eur is not None else art.get("declared_value_eur", 0.0))
    fee_eur = dv_eur * (fee_bps / 10000.0)

    dist = conf["distribution"]
    creators = fee_eur * (dist["creators_bps_of_fee"] / 10000.0)
    validators = fee_eur * (dist["validators_bps_of_fee"] / 10000.0)
    treasury = fee_eur * (dist["treasury_bps_of_fee"] / 10000.0)

    total_bps = int(art["revshare"]["total_bps"])
    alloc = []
    for a in art["revshare"]["allocations"]:
        share = creators * (a["share_bps"] / total_bps)
        alloc.append({"id": a["id"], "share_bps": a["share_bps"], "amount_eur": round(share, 6)})

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
            "treasury_eur": round(treasury, 6)
        },
        "allocations": alloc
    }
    write_jsonl_line(LEDG, entry)
    return entry

def main(argv):
    if len(argv) < 3:
        print("usage: accrue_royalty.py <artifact.json> <event> [declared_value_eur]", file=sys.stderr)
        sys.exit(2)
    art, ev = argv[1], argv[2]
    dv = float(argv[3]) if len(argv) > 3 else None
    out = accrue(art, ev, dv)
    print(json.dumps(out, indent=2))
    return 0

if __name__ == "__main__":
    sys.exit(main(sys.argv))
