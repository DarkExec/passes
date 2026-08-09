#!/usr/bin/env bash
set -euo pipefail
root="${1:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}"
for path in AGENTS.md README.md harness/AGENTS.md harness/DOCTRINE.md harness/PLAYBOOK.md efficiency/AGENTS.md efficiency/DOCTRINE.md efficiency/PLAYBOOK.md scripts/validate.sh; do
  [[ -s "$root/$path" ]] || { echo "missing pass scaffold file: $path" >&2; exit 1; }
done
python3 - "$root" <<'PY'
from pathlib import Path
import sys

root = Path(sys.argv[1])
root_map = (root / "AGENTS.md").read_text()
assert "harness/AGENTS.md" in root_map and "efficiency/AGENTS.md" in root_map
assert "Start with one route" in root_map
for mode, subject in (("harness", "ordinary"), ("efficiency", "harness")):
    map_text = (root / mode / "AGENTS.md").read_text()
    doctrine = (root / mode / "DOCTRINE.md").read_text()
    playbook = (root / mode / "PLAYBOOK.md").read_text()
    assert "DOCTRINE.md" in map_text and "PLAYBOOK.md" in map_text
    for heading in ("## Read first", "## Boundary", "## Rules", "## Current decision status", "## Validate and exit"):
        assert heading in map_text
    assert "/srv/harness-ops.md" in doctrine
    assert "earliest" in playbook.lower() and "intervention" in playbook.lower()
    assert "retain`, `revise`, or `remove" in playbook
    assert subject in playbook.lower()
    for artifact in sorted((root / mode).glob("*.md")):
        if artifact.name != "AGENTS.md":
            assert artifact.name in map_text, f"unrouted {mode} artifact: {artifact.name}"
    assert len(map_text.splitlines()) <= 80, f"{mode}/AGENTS.md is no longer a compact map"
assert "docs/passes/scripts/validate.sh docs/passes" in (root / "README.md").read_text()
assert not list(root.rglob("PASS.md")), "PASS.md is superseded by scoped AGENTS.md maps"
PY
if git -C "$root" rev-parse --is-inside-work-tree >/dev/null 2>&1; then git -C "$root" diff --check; fi
echo "pass scaffold validation passed"
