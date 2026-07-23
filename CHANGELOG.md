# Changelog

All notable changes to `cowork-context-framework` will be documented in this file.

The project follows semantic versioning.

## [1.1.0] - 2026-07-23

First self-improvement release: hygiene and collaboration-model rules proven in real instance operation are promoted into the framework baseline. Applies to `frameworks/ko` and `frameworks/en` (release line kept in sync).

### Added
- `06_evolution/state_archive.md` (F-03) — new append-only Log/Archive artifact that harvested completion narratives are moved into, keeping `project_state.md` / `my_state.md` lean without losing history.
- Carryover Backlog single-SSOT table in `project_state.md` (F-02) — collects scattered carryover notes into one table, included in every session briefing (§1D), with the AI actively watching triggers rather than waiting to be asked.
- Framework Back-Port Queue in `retrospective.md` §4 (F-00) — a triggered pipeline that routes instance-discovered rules/patterns back into the framework (execution mechanism for principle #6), so later projects don't rediscover them.
- `01_cowork_protocol/role_realization.md` (F-07) — guide for how a role seat is executed (human / AI persona / independent subagent), why independent subagents decorrelate errors, and when to materialize a seat (especially adversarial review).
- Collaboration Execution Mode `solo | team` (F-06) — a `project_state.md` field, defined in `decision_authority_matrix.md`, that separates *seat definition* from per-session *bookkeeping*: `solo` keeps seat definitions as onboarding scaffold while dropping role bookkeeping.

### Changed
- Replaced the untriggered "compress when long" rule with triggered diet rules R1 (harvest completion narrative beyond the last 3 sessions on `마무리`) and R2 (split bloated table cells, but keep cells that still affect current work — no churn). Reflected in `session_protocol.md`, `project_state.md`, and `document_role_inventory.md` (F-01).
- Added the "no untriggered accumulation" invariant to `cowork.md` (F-04): every accumulating loaded document must declare a harvest/split trigger.
- Added the live-state-document size budget to `cowork.md` + a session-start self-check in `session_protocol.md` (F-05): the health metric is the absolute size of always-loaded state docs, not a doc:code ratio.
- `document_role_inventory.md` now registers `state_archive.md` (Log/Archive) and `role_realization.md`, and documents the R1/R2 operating rules.
- `upgrade_manifest.md` bumped to `Version = 1.1.0`, `From = 1.0.0`, with a `1.0.0 → 1.1.0` delta table (new files=ADD/SKIP, project_state & retrospective=MERGE, governance docs=REPLACE).

## [1.0.0] - 2026-03-20

- Initial clean baseline for the new `cowork-context-framework` repository.
- Source root moved to `frameworks/ko`.
- Published English install variant aligned under `frameworks/en` on the same release line.
- Upgrade manifest baseline reset to `Version = 1.0.0`, `From = 0.0.0`.
- Archive name reset to `cowork-context-framework-kr.zip`.
