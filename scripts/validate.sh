#!/usr/bin/env bash
set -euo pipefail
root="${1:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}"
for path in README.md harness/PASS.md harness/DOCTRINE.md harness/PLAYBOOK.md efficiency/PASS.md efficiency/DOCTRINE.md efficiency/PLAYBOOK.md scripts/validate.sh; do
  [[ -s "$root/$path" ]] || { echo "missing pass scaffold file: $path" >&2; exit 1; }
done
python3 - "$root" <<'PY'
from pathlib import Path
import sys

root = Path(sys.argv[1])
for mode, subject in (("harness", "ordinary"), ("efficiency", "harness")):
    map_text = (root / mode / "PASS.md").read_text()
    doctrine = (root / mode / "DOCTRINE.md").read_text()
    playbook = (root / mode / "PLAYBOOK.md").read_text()
    assert "DOCTRINE.md" in map_text and "PLAYBOOK.md" in map_text
    assert "Start with one route" in map_text
    assert "not the procedure" in map_text
    assert "/srv/harness-ops.md" in doctrine
    assert "earliest" in playbook.lower() and "intervention" in playbook.lower()
    assert "retain`, `revise`, or `remove" in playbook
    assert subject in playbook.lower()
assert "docs/passes/scripts/validate.sh docs/passes" in (root / "README.md").read_text()
PY
if git -C "$root" rev-parse --is-inside-work-tree >/dev/null 2>&1; then git -C "$root" diff --check; fi
echo "pass scaffold validation passed"
