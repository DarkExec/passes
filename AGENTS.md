# Passes

This directory owns agent-facing methodology for distinct meta-engineering passes. It is a map, not a manual or evidence archive, and enters execution only for explicit pass or scaffold work.

## Request routing

- For installation, target ownership, or bootstrap behavior, read [README.md](README.md).
- For a Harness pass over completed ordinary work, read [harness/AGENTS.md](harness/AGENTS.md).
- For an Efficiency pass over the immediately preceding Harness pass, read [efficiency/AGENTS.md](efficiency/AGENTS.md).
- For scaffold integrity, run `scripts/validate.sh`.

Start with one route. Add another only for a distinct unresolved decision.

## Working loop

1. Read the target repository's applicable instructions and current state first.
2. Keep `AGENTS.md` as the shortest complete decision map, `DOCTRINE.md` as stable mode-specific invariants, and `PLAYBOOK.md` as one bounded operating procedure.
3. Put accepted learning in the earliest ordinary or pass execution owner that a future agent will actually encounter.
4. Add an artifact only after a real trajectory gives it a retrieval trigger, owner, evidence basis, and retirement condition; route it from the applicable map in the same change.
5. Validate the seed and the installed target through their normal workflows.

## Boundaries

- Target truth and project-specific learning stay with the installed target; this seed owns only reusable bootstrap behavior.
- Comparative and causal evaluation stays with the target's independent evaluation owner.
- Keep the seed lean: every route has a real owner and retrieval trigger, installed copies are standalone, and delivery history stays in Git rather than active maps.
- Existing installations adopt later seed changes only through intentional target-owned review.

## Validation

Run `./scripts/validate.sh` in this source repository. An installed target runs `docs/passes/scripts/validate.sh docs/passes` plus its normal validator.
