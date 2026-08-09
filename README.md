# Passes

Passes is a copy-once bootstrap for target-owned agent pass memory. It gives each distinct meta-engineering pass a short entry map, its own focused doctrine, and room for selectively loaded patterns and proof without adding pass-only context to ordinary engineering.

The shared `/srv/harness-ops.md` doctrine remains authoritative for universal ownership, safety, delivery, proof, and maintenance. This repository specializes individual pass modes. After installation, the copied files belong entirely to the target repository and must not depend on this repository, retain its Git metadata, or update automatically.

## Included modes

- `AGENTS.md` is the scoped root map for using and maintaining the pass scaffold.
- `harness/AGENTS.md` is the compact entry map for a harness pass.
- `harness/DOCTRINE.md` defines placement, adoption, qualification, and anti-entropy rules distinctive to harness passes.
- `harness/PLAYBOOK.md` runs one bounded completed-trajectory improvement loop.
- `efficiency/AGENTS.md` is the compact entry map for an efficiency pass.
- `efficiency/DOCTRINE.md` defines evidence, break-even, placement, qualification, and scope rules distinctive to efficiency passes.
- `efficiency/PLAYBOOK.md` runs one bounded improvement loop over the immediately preceding harness pass.

Add another mode only after recurring work demonstrates a distinct subject, output owner, evidence boundary, and stop condition.

## Install into a target repository

The installing agent must first read the target's applicable `AGENTS.md`, resolve the repository that owns its harness scaffold, inspect existing pass or closeout guidance, and preserve unrelated work. Installation is a normal target-repository change and should follow that repository's validation, review, delivery, and cleanup workflow.

Stage the tracked template without retaining a nested repository:

```bash
target_root=/absolute/path/to/target
pass_seed=$(mktemp -d)
git clone --depth 1 https://github.com/DarkExec/passes "$pass_seed/source"
mkdir -p "$pass_seed/tracked"
git -C "$pass_seed/source" archive HEAD | tar -x -C "$pass_seed/tracked"
```

For a target with no `docs/passes/`, install the staged tracked tree and remove the temporary clone:

```bash
test ! -e "$target_root/docs/passes"
mkdir -p "$target_root/docs/passes"
cp -a "$pass_seed/tracked/." "$target_root/docs/passes/"
rm -rf "$pass_seed"
```

For an existing target, compare the staged tree with its current `docs/passes/` and merge intentionally; never overwrite local pass doctrine, maps, patterns, or proof wholesale. Remove the temporary clone after reviewing the exact merge. Do not copy `.git`, configure an upstream remote, create a submodule, or leave the temporary clone behind.

Customize each installed mode `AGENTS.md` as a brutally short target-local map to existing authoritative code, tests, validation, architecture, runbooks, telemetry, and proof. Link existing owners before moving or rewriting them. Do not create empty taxonomies or migrate history merely to fill the structure.

Configure the owning pass prompts with target-relative instructions:

```text
Harness: After reading /srv/harness-ops.md, read docs/passes/harness/AGENTS.md from the target repository and follow its routing.
Efficiency: After reading /srv/harness-ops.md, read docs/passes/efficiency/AGENTS.md from the target repository and follow its routing.
```

Ordinary engineering prompts must not load `docs/passes/`; ordinary agents should encounter the executable paths, tests, defaults, errors, entry routes, and procedures produced by passes rather than the meta-engineering instructions themselves.

Before delivery, run `docs/passes/scripts/validate.sh docs/passes`, verify every target-local link resolves, confirm that `AGENTS.md` files remain maps rather than journals, ensure no nested Git metadata or external runtime dependency remains, run `git diff --check`, and run the target's normal validator. Remove the temporary seed directory after the exact installation diff has been reviewed.

## Evolving an installed copy

Installed copies evolve from their own trajectories. Project-specific learning stays with the project. When evidence from multiple projects supports a genuinely general pass principle, propose it to this repository through normal review so future installations benefit.

Existing installations never inherit upstream changes automatically. Adopt a later upstream improvement only as a reviewed target-owned change, preserving local owners and deleting or compacting superseded guidance.
