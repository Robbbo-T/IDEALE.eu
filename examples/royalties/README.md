# Example Artifact with Creator Royalties

This directory contains example artifact metadata files demonstrating the creator royalties system.

## Example 1: Simple Two-Author Artifact

See `example-simple.artifact.json` for a basic artifact with two creators.

## Example 2: Multi-Author with Derivative Policy

See `example-derivative.artifact.json` for an artifact that allows derivative works.

## Usage

To accrue royalties for an artifact:

```bash
python3 scripts/accrue_royalty.py path/to/artifact.json <event-type> [declared-value-eur]
```

Event types:
- `anchor` - First anchoring of the artifact
- `reuse` - Reuse by another organization
- `verify` - Premium verification/certification
- `derivative` - Creation of a derived work

Example:
```bash
python3 scripts/accrue_royalty.py examples/royalties/example-simple.artifact.json reuse 10000
```
