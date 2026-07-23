# Changelog

All notable changes to `cowork-context-framework` will be documented in this file.

The project follows semantic versioning.

## [1.1.0] - 2026-07-23

First self-improvement release: state-document hygiene rules proven in real instance operation are promoted into the framework baseline. Applies to `frameworks/ko` (English variant sync pending).

### Added
- `06_evolution/state_archive.md` — new append-only Log/Archive artifact that harvested completion narratives are moved into, keeping `project_state.md` / `my_state.md` lean without losing history.
- Carryover Backlog single-SSOT table in `project_state.md` — collects scattered carryover notes into one table, included in every session briefing (§1D), with the AI actively watching triggers rather than waiting to be asked.
- Framework Back-Port Queue in `retrospective.md` §4 — a triggered pipeline that routes instance-discovered rules/patterns back into the framework (execution mechanism for principle #6), so later projects don't rediscover them.

### Changed
- Replaced the untriggered "compress when long" rule with triggered diet rules R1 (harvest completion narrative beyond the last 3 sessions on `마무리`) and R2 (split bloated table cells, but keep cells that still affect current work — no churn). Reflected in `session_protocol.md`, `project_state.md`, and `document_role_inventory.md`.
- `document_role_inventory.md` now registers `state_archive.md` (Log/Archive) and documents the R1/R2 operating rules.
- `upgrade_manifest.md` bumped to `Version = 1.1.0`, `From = 1.0.0`, with a `1.0.0 → 1.1.0` delta table (state_archive=ADD/SKIP, project_state & retrospective=MERGE, governance docs=REPLACE).

### Notes
- `frameworks/en` is not yet synced to 1.1.0 — follow-up required to keep the release line aligned.

## [1.0.0] - 2026-03-20

- Initial clean baseline for the new `cowork-context-framework` repository.
- Source root moved to `frameworks/ko`.
- Published English install variant aligned under `frameworks/en` on the same release line.
- Upgrade manifest baseline reset to `Version = 1.0.0`, `From = 0.0.0`.
- Archive name reset to `cowork-context-framework-kr.zip`.
